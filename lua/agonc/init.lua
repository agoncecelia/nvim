require("agonc.remap")
require("agonc.set")

function Remember_cursor_position()
    local last_pos_line = vim.fn.line("'\"")
    if last_pos_line > 1 and last_pos_line <= vim.fn.line("$") then
        vim.cmd("normal! g`\"")
    end
end

-- 2. Set the auto command using that Lua function
vim.api.nvim_exec([[
  augroup vimrc_remember_cursor_position
    autocmd!
    autocmd BufReadPost * lua Remember_cursor_position()
  augroup END
]], false)

local cmds = {
    "cnoreabbrev W! w!",
    "cnoreabbrev Q! q!",
    "cnoreabbrev Qall! qall!",
    "cnoreabbrev Wq wq",
    "cnoreabbrev Wa wa",
    "cnoreabbrev wQ wq",
    "cnoreabbrev WQ wq",
    "cnoreabbrev W w",
    "cnoreabbrev Q q",
    "cnoreabbrev Qall qall"
}

for _, cmd in ipairs(cmds) do
    vim.cmd(cmd)
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Remove help netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
