local util = require("easy-commands.impl.util")
local editor = require("easy-commands.impl.util.editor")
local strings = require("easy-commands.impl.util.layer1.strings")

-- Third party dependency
local refactoring = require("refactoring")
local M = {}

-- TODO: remove this
local function replace_selected_text_with_clipboard()
    vim.cmd([[normal! gv"_dP]])
end

-- cmdFunc could do some trick to the selectedText
local function Perform_cmd_to_selected_text(cmdFunc)
    local selectedText = editor.getSelectedText()
    local output = util.Call_sys_cmd(cmdFunc(selectedText))
    util.CopyToSystemClipboard(strings.Trim(output))
    replace_selected_text_with_clipboard()
end

M.InlineVariable  = function()
    refactoring.refactor('Inline Variable')
end

M.ExtractVariable = function()
    refactoring.refactor('Extract Variable')
end

M.ExtractFunction = function()
    refactoring.refactor('Extract Function')
end

M.ToCamelCase     = {
    callback = function()
        Perform_cmd_to_selected_text(function(selectedText)
            return 'toolbox formatConvert toCamelCase "' .. selectedText .. '"'
        end)
    end,
    allow_visual_mode = true,
}

M.ToConstantCase  = {
    callback = function()
        Perform_cmd_to_selected_text(function(selectedText)
            return 'toolbox formatConvert toConstantCase "' .. selectedText .. '"'
        end)
    end,
    allow_visual_mode = true,
}

M.ToKebabCase     = {
    callback = function()
        Perform_cmd_to_selected_text(function(selectedText)
            return 'toolbox formatConvert ToKebabCase "' .. selectedText .. '"'
        end)
    end,
    allow_visual_mode = true,
}

M.ToSnakeCase     = {
    callback = function()
        Perform_cmd_to_selected_text(function(selectedText)
            return 'toolbox formatConvert toSnakeCase "' .. selectedText .. '"'
        end)
    end,
    allow_visual_mode = true,
}

return M
