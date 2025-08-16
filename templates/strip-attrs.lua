-- strip-attrs.lua
function Para(el)
  local s = pandoc.utils.stringify(el)
  if s:match("^{#.-}$") then
    return {} -- remove that paragraph
  end
end