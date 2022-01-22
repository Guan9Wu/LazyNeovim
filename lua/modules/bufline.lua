vim.opt.termguicolors = true
require('bufferline').setup{
  options = {
    numbers = function(opts)
        return string.format('%s|%s)',opts.ordinal, opts.lower(opts.id))
    end,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"

    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from lua files for example
      if buf.name:match('%.lua') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or ""
        return " " .. icon .. count
    end,
    custom_filter = function(buf, buf_nums)
        if not vim.bo[buf].filetype == "help" then
            return true
        elseif not vim.bo[buf].filetype == "checkhealth" then
            return true
        end
        local logs =
            vim.tbl_filter(
                function(b)
                    return vim.bo[b].filetype == "log"
                end,
                buf_nums
            )
        if vim.tbl_isempty(logs) then
            return true
        end

        -- 2. if there are log buffers then only show the log buffer
        local tab_num = vim.fn.tabpagenr()
        local is_log = vim.bo[buf].filetype == "log"
        -- only show log buffers in secondary tabs
        return (tab_num == 2 and is_log) or (tab_num ~= 2 and not is_log)
    end,
    offsets = {
        {filetype = "NvimTree", text = "NvimTree", text_align = "center"},
        {filetype = "undotree", text = "UndoTree", text_align = "center"}
    },
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "thick",
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    sort_by = "tabs"
  }
}
