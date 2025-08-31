# Neovim Config (lazy.nvim)

A clean, modular Neovim setup built around lazy.nvim with batteries included: Treesitter, Telescope, LSP tooling via Mason, completion, formatting, Git signs, folding, UI/UX polish, and more.

This README focuses on easy maintenance: where things live, how to update safely, and how to add/remove features without breaking the rest.

## Requirements

- Neovim 0.9+ (0.10 recommended)
- Git (for managing plugins)
- ripgrep (for Telescope live grep): `rg`
- Optional but useful: `fd`, `node`, `python3 + pip`, `go`, `cargo` (for certain servers/tools)

Verify basics in Neovim: `:checkhealth`

## Quick start

- Place this repo at `~/.config/nvim`.
- Start Neovim once to let lazy.nvim install plugins. Internet required.
- Then run the basics:

```zsh
# Update and install everything declared in lockfile
nvim +"Lazy sync" +qa

# (Optional) Update Treesitter parsers
nvim +"TSUpdate" +qa

# (Optional) Open Mason UI to install LSPs/formatters
nvim +"Mason" +qa
```

If anything looks off, run `:checkhealth` inside Neovim.

## Project layout

Top-level files/folders you'll change most often:

- `init.lua` – Entry point; loads core modules and the plugin manager.
- `lazy-lock.json` – Plugin versions lockfile. Commit this when plugin updates change it.
- `lua/core/`
  - `init.lua` – Core bootstrap/wiring.
  - `settings.lua` – Neovim options (numbering, splits, UI toggles, etc.).
  - `keymaps.lua` – Global keymaps and leader bindings.
  - `manager.lua` – lazy.nvim setup and plugin registration glue.
  - `plugins/` – One file per domain/feature; easy to discover/replace:
    - `cmp.lua` – Autocompletion (nvim-cmp and sources).
    - `colorschemes.lua` – Available themes and default colorscheme.
    - `conform.lua` – Formatting setup and filetype rules.
    - `dependencies.lua` – Shared helper deps (Lua libs, plenary, etc.).
    - `gitsigns.lua` – Git gutters, blame, hunk actions.
    - `illuminate.lua` – Word under cursor references highlighting.
    - `indent-blankline.lua` – Indentation guides.
    - `mason.lua` – LSP/DAP/formatters installers and ensure_installed lists.
    - `noice.lua` – Better cmdline/notifications.
    - `quality.lua` – Quality-of-life tooling (linters/diagnostics helpers).
    - `refactoring.lua` – Refactoring helpers.
    - `spectre.lua` – Project-wide search/replace UI.
    - `surround.lua` – Surround textobjects.
    - `telescope.lua` & `telescope-project.lua` – Fuzzy finder core and project picker.
    - `todo_comments.lua` – Highlight/FZF TODO/FIXME.
    - `treesitter.lua` – Syntax & textobjects configuration.
    - `ufo.lua` – Modern code folding.
    - `ui.lua` – General UI polish (statusline/components, etc.).
    - `venv.lua` – Python virtualenv helpers.
    - `which_key.lua` – Keymap discovery UI.

Note: Exact plugins/options come from these files; see them for the authoritative configuration.

## Daily commands cheat sheet

- Plugin manager (lazy.nvim)
  - `:Lazy` – UI
  - `:Lazy sync` – Install/remove to match config + lockfile
  - `:Lazy update` – Update plugins (refreshes lockfile)
- Tooling
  - `:Mason` – Install LSPs/formatters/debuggers
  - `:TSUpdate` – Update Treesitter parsers
- Finder/UX
  - `:Telescope` – Open Telescope pickers
  - `:Spectre` – Search & replace UI
  - `:TodoTelescope` – TODO/FIXME picker (if enabled)

## How to change behavior

- Options: edit `lua/core/settings.lua`.
- Global keymaps: edit `lua/core/keymaps.lua`.
- Colorscheme: set default in `lua/core/plugins/colorschemes.lua`.
- LSP/formatters: adjust `lua/core/plugins/mason.lua` and `lua/core/plugins/conform.lua`.
- Treesitter: tweak languages/features in `lua/core/plugins/treesitter.lua`.

After changes, restart Neovim or `:Lazy sync` when plugin specs changed.

## Adding a new plugin (lazy.nvim)

Create a new file under `lua/core/plugins/` or add to a related file. A minimal standalone spec looks like:

```lua
-- lua/core/plugins/myplugin.lua
return {
  {
    "author/repo", -- plugin repo
    event = "VeryLazy", -- or keys/ft/cmd
    opts = {}, -- plugin options
    config = function(_, opts)
      require("module").setup(opts)
    end,
    keys = {
      {"<leader>x", function() require("module").do_something() end, desc = "My action"},
    },
  },
}
```

Notes:
- Prefer lazy-loading (`event`, `cmd`, `ft`, or `keys`) to keep startup fast.
- Group related plugins in the same file (e.g., completion sources inside `cmp.lua`).
- If your plugin is a shared dependency used by many others, consider registering it in `dependencies.lua`.

## Updating safely

1) Update plugins and lockfile:

```zsh
nvim +"Lazy update" +qa
```

2) Run basic health checks:

```zsh
nvim +"checkhealth" +qa
```

3) Review and commit changes, especially `lazy-lock.json`:

```zsh
git add lazy-lock.json lua/ README.md
git commit -m "chore: plugin updates"
```

If something breaks, you can revert `lazy-lock.json` to restore prior versions.

## Troubleshooting

- Missing executables (e.g., formatters, language servers): open `:Mason` and install; or install system-wide.
- Telescope empty results: ensure `ripgrep` is installed and available in `$PATH`.
- Slow startup: verify plugins are lazy-loaded; move heavy config to `event/cmd/ft`-based specs.
- Colors/ligatures: ensure your terminal supports truecolor and your font has needed glyphs.

## Conventions

- Keep modules focused: one concern per file in `plugins/`.
- Use descriptive keymap descriptions (`desc`) so `which-key` stays useful.
- Prefer config via `opts` and a small `config` function over large imperative blocks.
- Commit the lockfile on every plugin update.

## License

Personal configuration. Reuse freely at your own risk.
