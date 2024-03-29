local opts = {}

opts = {
  execution_message = {
    message = function ()
      return ("saved ✅")
    end,
  },
  trigger_events = {
    immediate_save = { "BufLeave", "FocusLost" },
    defer_save = { "InsertLeave", "TextChanged" },
    cancel_defered_save = { "InsertEnter" },
  },
  debounce_delay = 2000,
}

return opts
