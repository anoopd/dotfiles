require("bufferline").setup {
  options = {
    separator_style = "slant",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "File Explorer" } },
  }
}
