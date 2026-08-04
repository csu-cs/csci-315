-- append-schedule-dates.lua
-- Pandoc Lua filter: annotate schedule table rows with dates.
--
-- Usage: set document metadata `schedule_start_date: "YYYY-MM-DD"`
-- The start date should be the date for week 1A (the first class meeting
-- of week 1). Optionally set `start_week: 1` if your numbering starts
-- elsewhere.
--
-- All logic runs inside Pandoc(doc) so metadata is always available
-- before any table is visited.

local utils = require('pandoc.utils')

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------

local function parse_iso_date(s)
  if not s or s == '' then return nil end
  local y, m, d = s:match('^(%d%d%d%d)%-(%d?%d)%-(%d?%d)')
  if not y then return nil end
  -- noon avoids DST edge-cases on 24h offsets
  return os.time{year=tonumber(y), month=tonumber(m), day=tonumber(d),
                 hour=12, min=0, sec=0}
end

local function format_date(t)
  local mon = os.date('%m', t)
  local day = tonumber(os.date('%d', t))
  return string.format('%s/%d', mon, day)
end

local function trim(s)
  return (s:gsub('^%s+', ''):gsub('%s+$', ''))
end

-- ---------------------------------------------------------------------------
-- Table annotation
-- ---------------------------------------------------------------------------

-- In pandoc 3.x the table AST is:
--   Table { bodies = { TableBody { body = { Row { cells = { Cell, … } }, … } } } }
-- Cell.content  -> Blocks (plain Lua table of Block userdata)
-- utils.stringify expects a Block/Inline/Blocks/Inlines/MetaValue,
-- NOT a Cell userdata — so we pass cell.content.

local function annotate_table(tbl, start_time, start_week)
  local bodies = tbl.bodies
  if not bodies then
    io.stderr:write('append-schedule-dates: no tbl.bodies found\n')
    return
  end

  for _, tbody in ipairs(bodies) do
    local rows = tbody.body
    if rows then
      for _, row in ipairs(rows) do
        -- row.cells is an array of Cell userdata objects
        local cells = row.cells
        if cells and cells[1] then
          local cell = cells[1]
          -- stringify cell.content (Blocks), not the Cell userdata itself
          local s = trim(utils.stringify(cell.content))
          io.stderr:write('append-schedule-dates: first cell = "' .. s .. '"\n')

          local num, letter = s:match('^(%d+)%s*([AaBb]?)$')
          if num and letter and letter ~= '' then
            letter = letter:upper()
            local weeknum = tonumber(num)
            local offset_days = (weeknum - start_week) * 7
                                + (letter == 'A' and 1 or 3)
            local target     = start_time + offset_days * 24 * 3600
            local datestr    = format_date(target)
            io.stderr:write('append-schedule-dates: week ' .. num .. letter
                            .. ' -> ' .. datestr .. '\n')

            -- Inject the date into the first Para/Plain block of the cell
            local content = cell.content   -- plain Lua table of Blocks
            if content and content[1] then
              local blk = content[1]
              -- blk.content is the Inlines list of a Para or Plain
              if (blk.t == 'Para' or blk.t == 'Plain') and blk.content then
                local inlines = blk.content
                table.insert(inlines, pandoc.Space())
                table.insert(inlines, pandoc.Str('(' .. datestr .. ')'))
              end
            end
          end
        end
      end
    end
  end

  -- Remove hard-coded fractional column widths so LaTeX calculates them
  -- automatically to fill the text width (avoids Overfull \hbox warnings).
  -- if tbl.colspecs then
  --   for i, spec in ipairs(tbl.colspecs) do
  --     tbl.colspecs[i] = { spec[1], pandoc.ColWidthDefault }
  --   end
  --   io.stderr:write('append-schedule-dates: reset ' .. #tbl.colspecs
  --                   .. ' colspecs to ColWidthDefault\n')
  -- end
end

-- ---------------------------------------------------------------------------
-- Main entry point: runs after all metadata is resolved
-- ---------------------------------------------------------------------------

function Pandoc(doc)
  local meta = doc.meta or {}

  local start_date_str = utils.stringify(meta.schedule_start_date
                                         or meta.start_date or '')
  local start_week     = tonumber(utils.stringify(meta.start_week or '')) or 1
  local start_time     = parse_iso_date(start_date_str)

  if not start_time then
    io.stderr:write('append-schedule-dates.lua: missing or invalid metadata'
                    .. ' `schedule_start_date` (YYYY-MM-DD). Skipping.\n')
    return doc
  end

  io.stderr:write('append-schedule-dates: start_date=' .. start_date_str
                  .. '  start_week=' .. tostring(start_week) .. '\n')

  -- Recursively visit all blocks; annotate every Table found.
  local function visit_block(blk)
    if blk.t == 'Table' then
      io.stderr:write('append-schedule-dates: visiting Table\n')
      annotate_table(blk, start_time, start_week)
    elseif blk.t == 'Div' then
      for _, child in ipairs(blk.content) do
        visit_block(child)
      end
    end
  end

  for _, blk in ipairs(doc.blocks) do
    visit_block(blk)
  end

  return doc
end
