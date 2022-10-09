vim.opt.termguicolors = true
local status, bufferline = pcall(require, "bufferline")
if not status then
  vim.notify("bufferline isn't found")
  return
end

bufferline.setup({
  options = {
    close_command = "Bdelete! %d",
    offsets = {
      {
        filetype = "NvimTree",
	text = "File Explorer",
	highlight = "Directory",
	text_align = "left",
      },
    },
  },
})
