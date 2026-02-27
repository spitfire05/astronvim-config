return {
  "akinsho/toggleterm.nvim",
  opts = function(_, opts)
    -- Keep most defaults from AstroNvim
    -- Only override shell when on Windows
    if vim.fn.has "win32" == 1 or vim.fn.has "win64" == 1 then
      -- Prefer pwsh (PowerShell 7+) if installed, fall back to powershell (5.1)
      local shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell"

      opts.shell = shell

      -- These flags fix common PowerShell issues in Neovim terminals:
      --   -NoLogo       → no startup banner
      --   -NoProfile    → skip profile loading (faster + cleaner)
      --   -ExecutionPolicy RemoteSigned → allow local scripts
      --   UTF-8 encoding handling
      opts.shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
      opts.shellquote = "" -- usually not needed with above
      opts.shellxquote = "" -- prevents extra quoting issues
    end

    -- Optional: you can add other toggleterm customizations here too, e.g.
    -- opts.direction = "float"
    -- opts.float_opts.border = "rounded"
    -- etc.

    return opts
  end,
}
