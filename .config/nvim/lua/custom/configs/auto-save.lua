local opts = {}

opts = {
  trigger_events = {
    immediate_save = { "BufLeave", "FocusLost" },
    defer_save = { "InsertLeave", "TextChanged" },
    cancel_deferred_save = { "InsertEnter" },
  },
  debounce_delay = 2000,
  -- Si quieres un mensaje personalizado, puedes usar callbacks:
  callbacks = {
    after_saving = function()
      vim.notify("saved ✅", vim.log.levels.INFO, { title = "auto-save" })
    end,
  },
}

return opts
