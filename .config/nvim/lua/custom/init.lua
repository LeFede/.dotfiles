
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true


vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.h",
  callback = function()
    local header_file = vim.fn.expand("%:p") -- Ruta completa del archivo .h
    local base_name = vim.fn.fnamemodify(header_file, ":r") -- Ruta sin extensión

    if vim.fn.filereadable(base_name .. ".cpp") == 1 then
      vim.bo.filetype = "cpp"
    elseif vim.fn.filereadable(base_name .. ".c") == 1 then
      vim.bo.filetype = "c"
    else
      print("No se encontró .c o .cpp asociado. Usando 'c' por defecto.")
      vim.bo.filetype = "c"
    end
  end,
})

