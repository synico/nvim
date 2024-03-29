require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    string = true,
    operators = true,
    comments = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
  palette_overrides = {
    bright_green = "#990000",
  }
})
