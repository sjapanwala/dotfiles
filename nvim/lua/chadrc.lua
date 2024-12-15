-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

vim.opt.relativenumber = true
M.base46 = {
	theme = "gruvbox",

	-- hl_override = {
	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
  transparency = true,
	-- },
}

vim.api.nvim_create_user_command('Format', function()
    vim.cmd('%!jq')  -- LSP formatting
    vim.cmd('write')  -- Optional: save after formatting
end, {})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})



vim.keymap.set("n", "<space>st", function ()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 8)
end)


vim.keymap.set("n", "<space>md", function()
    local filename = vim.fn.expand("%:p")
    vim.cmd("!source ~/.zshrc && showmd " .. vim.fn.shellescape(filename))
end)



vim.keymap.set("n", "<space>py", function()
    local filename = vim.fn.expand("%:p")
    vim.cmd("!" .. "python3 " .. vim.fn.shellescape(filename))
end)

vim.keymap.set("n", "<space>gcc", function()
    local filename = vim.fn.expand("%:p")
    local output_filename = filename:gsub("%.c$", "")  -- Remove .c extension
    
    -- Open a new split terminal
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 8)
    
    -- Send the compile and run command to the terminal
    vim.api.nvim_chan_send(vim.b.terminal_job_id, 
        string.format("gcc %s -o %s && %s\n", 
        vim.fn.shellescape(filename), 
        vim.fn.shellescape(output_filename), 
        vim.fn.shellescape(output_filename)
    ))
    
    -- Optional: Go back to the previous window
    vim.cmd('wincmd p')
    
    -- Notify in the command line
    vim.notify("Compiling and running: " .. filename, vim.log.levels.INFO)
end)


return M
