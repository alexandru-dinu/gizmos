require("lualine").setup {
    options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
            { "filename", path = 3 },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_c = { "filename" },
        lualine_x = { "location" },
    },
    tabline = {
        lualine_a = {
            {
                "buffers",
                mode = 2,
                symbols = { modified = " [+]" },
            },
        },
        lualine_z = {
            { "tabs", mode = 0, path = 0 },
        },
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}

-- this option is set here b/c it's tied to tabline config in lualine
function jump_to_buffer(idx)
    -- retrieve all valid buffers (ignore [scratch])
    local buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buftype") ~= "nofile"
    end, vim.api.nvim_list_bufs())

    -- only jump if valid index
    if idx > 0 and idx <= #buffers then
        vim.api.nvim_set_current_buf(buffers[idx])
    end
end

vim.api.nvim_set_keymap("n", "gb", "<CMD>lua jump_to_buffer(vim.v.count1)<CR>", { noremap = true, silent = true })
