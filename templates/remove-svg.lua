-- remove-svg.lua
function Image(el)
  if el.src:match("%-dark%.svg$") then
    -- Remove dark-themed SVGs entirely
    return {}
  elseif el.src:match("/?images/csu_logo%.svg$") then
    return {}
  elseif el.src:match("%.svg$") then
    -- Replace other .svg file references with .pdf of the same name
    el.src = el.src:gsub("%.svg$", ".pdf")

    -- Make the path local for these images
    el.src = el.src:gsub("^/images/syllabus/", "")

    return el
  end

  return el
end