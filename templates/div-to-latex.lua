-- div-to-latex.lua

-- Keep a simple stack so we can handle literal ::: lines (when fenced_divs
-- isn't enabled) by turning opening/closing markers into LaTeX begin/end
-- pairs with the correct class.
local env_stack = {}

local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

function Div(el)
  local classes = el.classes or (el.attr and el.attr.classes) or {}
  if #classes > 0 then
    local cls = classes[1]
    local title = ""
    if el.attributes and el.attributes.title then
      title = el.attributes.title
    elseif el.attr and el.attr.attributes and el.attr.attributes.title then
      title = el.attr.attributes.title
    end

    local blocks = {}
    if title ~= "" then
      table.insert(blocks, pandoc.RawBlock('latex', '\\begin{'..cls..'}{'..pandoc.utils.stringify(title)..'}'))
    else
      table.insert(blocks, pandoc.RawBlock('latex', '\\begin{'..cls..'}'))
    end
    for _, b in ipairs(el.content) do table.insert(blocks, b) end
    table.insert(blocks, pandoc.RawBlock('latex', '\\end{'..cls..'}'))
    return blocks
  end
  return el
end

-- Handle the case where the source still contains literal ':::' lines
-- (Pandoc wasn't run with +fenced_divs). Convert those Para markers into
-- begin/end RawBlocks and maintain the stack so closing markers end the
-- correct environment.
function Para(el)
  local s = pandoc.utils.stringify(el)
  -- Opening marker: ::: class [optional title]
  local open_cls, open_title = s:match("^%s*:::%s*([%w%-%_]+)%s*(.-)%s*$")
  if open_cls and open_cls ~= "" then
    open_title = trim(open_title or "")
    table.insert(env_stack, open_cls)
    if open_title ~= "" then
      return pandoc.RawBlock('latex', '\\begin{'..open_cls..'}{'..pandoc.utils.stringify(open_title)..'}')
    else
      return pandoc.RawBlock('latex', '\\begin{'..open_cls..'}')
    end
  end

  -- Closing marker: :::
  if s:match("^%s*:::%s*$") then
    local cls = table.remove(env_stack) or "div"
    return pandoc.RawBlock('latex', '\\end{'..cls..'}')
  end

  return el
end