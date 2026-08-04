-- prepend-links.lua
function Link(el)
  -- Remove links with anchor text "Download\nPrintable Version"
  local text = pandoc.utils.stringify(el.content)
  if text:match("^%s*Download%s+Printable%s+Version%s*$") then
    return {}
  end
  -- If this is an in-document fragment link (e.g. "#section-id"),
  -- leave it alone so Pandoc produces an internal PDF link.
  if el.target:match("^#") then
    return el
  end

  -- Add full URL to other relative links
  if not el.target:match("^https?://") then
    el.target = "https://csu-cs.github.io/csci-315/" .. el.target
  end
  return el
end
