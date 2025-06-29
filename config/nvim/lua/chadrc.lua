local M = {}

M.ui = {
  theme = "chadtain",
  theme_toggle = { "chadtain", "chadtain"},
  tabufline = {
    enabled = false
  },
}

-- TODO: move to override file

M.override = {
  Comment = {
    italic = true,
  },
  -- TODO: fix colors for view git diff file
  DiffChange = {
    bg = "#464414",
    fg = "none",
  },
  DiffAdd = {
    bg = "#103507",
    fg = "none",
  },
  DiffRemoved = {
    bg = "#461414",
    fg = "none",
  },
}

M.to_setup = {
  'angularls',
  'tsserver',
}

return M
