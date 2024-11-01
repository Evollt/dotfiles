local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local i = ls.insert_node

ls.add_snippets("vue", {
  s("vue-setup", {
    t({
      '<script setup lang="ts">',
      "",
      "</script>",
      "",
      "<template>",
      "  <div>",
      "",
      "  </div>",
      "</template>",
      "",
      '<style scoped lang="scss">',
      "",
      "</style>",
    }),
  }),
})
