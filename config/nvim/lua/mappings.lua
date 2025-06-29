require("nvchad.mappings")

local map = vim.keymap.set
local opts = { silent = true, noremap = true }

map("n", "<leader>w", "<cmd>w<CR>", { desc = "File Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "File Close" })
map("n", "\\", "<cmd>:vsplit <CR>", { desc = "Vertical split" })
map("n", "<C-\\>", "<cmd>:split <CR>", { desc = "Horizontal split" })

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- neotest

map("n", "<leader>tt", function()
        require("neotest").run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run file test" })
map("n", "<leader>to", ":Neotest output<CR>", { desc = "Test output" })
map("n", "<leader>ts", ":Neotest summary<CR>", { desc = "Test summary" })

--git

map("n", "<leader>gl", "<cmd>:Flog<CR>", { desc = "Git log" })
map("n", "<leader>gf", "<cmd>:DiffviewFileHistory<CR>", { desc = "Git file history" })
map("n", "<leader>gh", "<cmd>:DiffviewOpen<CR>", { desc = "Git last commit" })
map("n", "<leader>gt", "<cmd>:DiffviewToggleFile<CR>", { desc = "Git diff view file" })
map("n", "<leader>gs", "<cmd>:Git<CR>", { desc = "Git status" })
map("n", "<leader>gc", "<cmd>:Git commit<CR>", { desc = "Git commit" })
map("n", "<leader>gp", "<cmd>:Git push<CR>", { desc = "Git commit" })
map("n", "<leader>df", "<cmd>:Gdiffsplit<CR>", { desc = "Git diff split" })

map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todo" })

local builtin = require('telescope.builtin')
map("n", "<C-space>", builtin.buffers, { desc = "Telescope find buffers" })
map("n", "<C-o>", "<cmd>:bprev<CR>", { desc = "Telescope prev buffer" })
map("n", "<C-i>", "<cmd>:bnext<CR>", { desc = "Telescope next buffer" })
map("n", "<leader>gr", builtin.lsp_references, { desc = "Telescope find references" })

-- for russian layout
map("i", "<c-х>", "<C-[>", opts)
map("n", "л", "gk", opts)
map("n", "о", "gj", opts)
map("i", "<C-г>", "<C-G>u<C-U>", opts)
map("i", "<C-ц>", "<C-G>u<C-W>", opts)


-- TODO: add maps for add, search, other action for todo list
