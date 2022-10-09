require("mason").setup({
  ui = {
    check_outdated_packages_on_open = true,
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
