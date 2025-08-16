-- prepend-links.lua
function Link(el)
  if not el.target:match("^https?://") then
    el.target = "https://csu-cs.github.io/csci-315/" .. el.target
  end
  return el
end
