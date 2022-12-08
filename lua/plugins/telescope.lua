local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("telescope isn't found")
  return
end

telescope.setup{
  defaults = {
    initial_mode = "normal",
  },
  picker = {
    find_files = {
      theme = "dropdown", -- options: dropdown, cursor, ivy
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
      }),
    },
  },
}

pcall(telescope.load_extension, "env")
pcall(telescope.load_extension, "ui-select")
