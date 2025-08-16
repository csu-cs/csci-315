-- remove-svg.lua
function Image(el)
  if el.src:match("%.svg$") then
    -- Remove the image entirely (return empty inline)
    return {}
  else
    return el
  end
end