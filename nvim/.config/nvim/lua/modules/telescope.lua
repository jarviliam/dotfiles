local ok, telescope = as.safe_require("telescope")
if not ok then
  return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local map = vim.keymap.set

telescope.setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,
    winblend = 0,
    file_ignore_patterns = { "node_modules", ".terraform", "%.jpg", "%.png" },
    layout_strategy = "flex",
    layout_config = {
      width = 0.95,
      height = 0.85,
      prompt_position = "top",

      horizontal = {
        width = 0.9,
        preview_cutoff = 60,
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.7)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },
      vertical = {
        width = 0.75,
        height = 0.85,
        preview_height = 0.4,
        mirror = true,
      },
      flex = {
        flip_columns = 120,
      },
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-v>"] = actions.select_vertical,

        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,

        ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
        ["<Esc>"] = actions.close,
      },
      n = {
        ["<CR>"] = actions.select_default + actions.center,
        ["<C-d>"] = actions.delete_buffer,
        ["<C-v>"] = actions.select_vertical,

        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,

        ["<Esc>"] = actions.close,
      },
    },

    use_less = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  },
  pickers = {
    find_files = {
      find_command = {
        "fd",
        "--type",
        "f",
        "--hidden",
        "--exclude",
        ".git",
        "--strip-cwd-prefix",
      },
    },
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["<C-d>"] = actions.delete_buffer,
        },
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
})
local M = {}

M.project_files = function(opts)
  opts = opts or {}

  local _git_pwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

  if vim.v.shell_error ~= 0 then
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    builtin.fd(opts)
    return
  end

  builtin.git_files(opts)
end

M.curbuf = function()
  local opts = require("telescope.themes").get_dropdown({
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  })
  builtin.current_buffer_fuzzy_find(opts)
end

M.funcsel = function()
  local opts = require("telescope.themes").get_dropdown({
    symbols = { "function", "method" },
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  })
  builtin.lsp_document_symbols(opts)
end

map(
  "n",
  "<leader>/",
  ":Telescope live_grep theme=get_ivy<CR>",
  { silent = true, desc = "telescope: live grep" }
)
map(
  "n",
  "<leader>.",
  M.project_files,
  { silent = true, desc = "telescope: fd" }
)
map(
  "n",
  "<leader><TAB>",
  builtin.buffers,
  { silent = true, desc = "telescope: buffers" }
)
map(
  "n",
  "<leader>:",
  builtin.command_history,
  { silent = true, desc = "telescope: command history" }
)

-- map("n", "<leader>ss", function()
--   builtin.lsp_document_symbols({
--     symbols = {
--       "Class",
--       "Function",
--       "Method",
--       "Constructor",
--       "Interface",
--       "Module",
--       "Struct",
--       "Trait",
--     },
--   })
-- end, { silent = true, desc = "telescope: buffer functions" })
map(
  "n",
  "<leader>nv",
  M.funcsel,
  { silent = true, desc = "telescope: buffer functions" }
)
map(
  "n",
  "<leader>nb",
  M.curbuf,
  { silent = true, desc = "telescope: buffer fuzzy" }
)
map(
  "n",
  "<leader>hd",
  builtin.keymaps,
  { silent = true, desc = "telescope: keymap" }
)

map(
  "n",
  "<leader>sm",
  builtin.marks,
  { silent = true, desc = "telescope: marks" }
)

map(
  "n",
  "<leader>sh",
  builtin.command_history,
  { silent = true, desc = "telescope: command history" }
)

telescope.load_extension("fzf")
telescope.load_extension("z")
telescope.load_extension("dap")

map("n", "<leader>d.", ":Telescope dap list_breakpoints<CR>", { silent = true })
map("n", "<leader>fz", function()
  telescope.extensions.z.list({
    cmd = { vim.o.shell, "-c", "zoxide query -ls" },
  })
end, { silent = true })
