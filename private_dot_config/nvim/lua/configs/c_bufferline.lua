local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

-- key map
vim.api.nvim_set_keymap('n', 'b[',  [[:BufferLineCyclePrev<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'b]',  [[:BufferLineCycleNext<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gb',  [[:BufferLinePick<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bx',  [[:BufferLinePickClose<CR>]], { noremap = true, silent = true })

local colors = require('dracula').colors()

bufferline.setup {
   options = {
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      show_close_icon = true,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false,
      custom_filter = function(buf_number)
         -- Func to filter out our managed/persistent split terms
         local present_type, type = pcall(function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
         end)

         if present_type then
            if type == "vert" then
               return false
            elseif type == "hori" then
               return false
            end
            return true
         end

         return true
      end,
   },
}
