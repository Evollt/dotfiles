local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- public function
  s(
    "pubf",
    fmt(
      [[
        public function {}({})
        {{
            {}
        }}
      ]],
      {
        i(1, "methodName"),
        i(2),
        i(3),
      }
    )
  ),

  -- public static function
  s(
    "spubf",
    fmt(
      [[
        public static function {}({})
        {{
            {}
        }}
      ]],
      {
        i(1, "methodName"),
        i(2),
        i(3),
      }
    )
  ),

  -- protected function
  s(
    "prof",
    fmt(
      [[
        protected function {}({})
        {{
            {}
        }}
      ]],
      {
        i(1, "methodName"),
        i(2),
        i(3),
      }
    )
  ),

  -- protected static function
  s(
    "sprof",
    fmt(
      [[
        protected static function {}({})
        {{
            {}
        }}
      ]],
      {
        i(1, "methodName"),
        i(2),
        i(3),
      }
    )
  ),

  -- private function
  s(
    "prif",
    fmt(
      [[
        private function {}({})
        {{
            {}
        }}
      ]],
      {
        i(1, "methodName"),
        i(2),
        i(3),
      }
    )
  ),

  -- private static function
  s(
    "sprif",
    fmt(
      [[
        private static function {}({})
        {{
            {}
        }}
      ]],
      {
        i(1, "methodName"),
        i(2),
        i(3),
      }
    )
  ),
}
