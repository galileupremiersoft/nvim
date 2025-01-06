local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


ls.add_snippets('typescriptreact', {
  s('h', t('test')),
  s('cn', t({'className="'}), i(1, "name"), t({'"'})),
})
ls.add_snippets('typescriptreact', {
  s('fc', t('import React from "react";\n\nconst MyComponent: React.FC = () => {\n  return (\n    <div>\n      {/* Your content here */}\n    </div>\n  );\n};\n\nexport default MyComponent;')),
})

require('luasnip').filetype_extend("typescript", { "typescriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })
