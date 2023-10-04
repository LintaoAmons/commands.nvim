---@type EasyCommand.Command[]
local M = {
  {
    name = "ToggleDebugUI",
    callback = function()
      require("dapui").toggle({})
    end,
    dependencies = { "https://github.com/mfussenegger/nvim-dap" },
    description = "toggle debug UI",
  },
  {
    name = "DebugStartOrContinue",
    callback = function()
      require("dap").continue()
    end,
  },
  {
    name = "DebugToggleBreakpoint",
    callback = function()
      require("dap").toggle_breakpoint()
    end,
  },
  {
    name = "DebugStepOver",
    callback = function()
      require("dap").step_over()
    end,
  },
  {
    name = "DebugStepInto",
    callback = function()
      require("dap").step_into()
    end,
  },
  {
    name = "DebugStop",
    callback = function()
      require("dap").terminate()
    end,
  },
  {
    name = "DebugWidget",
    callback = function()
      require("dap.ui.widgets").hover()
    end,
  },
}

return M
