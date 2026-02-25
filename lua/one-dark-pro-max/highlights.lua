-- lua/one-dark-pro-max/highlights.lua
local palette = require("one-dark-pro-max.palette")

local M = {}

-- función para limpiar estilos si no se especifican
local function no_style(opts)
    opts.bold = opts.bold or false
    opts.italic = opts.italic or false
    return opts
end

-- función que genera todos los grupos según opciones
local function get_groups(opts)
    local bg_main = opts.transparency and "none" or palette.bg
    local bg_float = opts.transparency and "none" or palette.bg_float

    local groups = {
        -- Base
        Normal = { fg = palette.fg, bg = bg_main },
        NormalFloat = { bg = bg_float },
	StatusLine = { bg = bg_main },
	FloatBorder = { bg = bg_main },
        CursorLineNr = { fg = palette.active_line_number },
        CursorLineNC = { fg = palette.active_line_number },
        LineNr = { fg = palette.line_number },
        Visual = { bg = palette.visual },
        Search = { bg = palette.search },
	PMenu = { bg = bg_main },

        -- Sintaxis normal
        Comment = { fg = palette.comment, italic = opts.italic },
        String = { fg = palette.string },
        Keyword = { fg = palette.keyword, bold = opts.bold },
        Function = { fg = palette.func },
        Number = { fg = palette.number },
        Type = { fg = palette.type },
        Constant = { fg = palette.constant },
        Operator = { fg = palette.operator },
        Identifier = { fg = palette.variable },
	Special = { fg = palette.type },
	Statement = { fg = palette.keyword },
	Title = { fg = palette.variable },
	Directory = { fg = palette.variable },

        -- Tree-sitter general
        ["@comment"] = { fg = palette.comment, italic = opts.italic },
        ["@string"] = { fg = palette.string },
        ["@keyword"] = { fg = palette.keyword },
        ["@function"] = { fg = palette.func },
        ["@type"] = { fg = palette.type },
        ["@constant"] = { fg = palette.constant },
        ["@operator"] = { fg = palette.operator },
        ["@variable"] = { fg = palette.variable },

        -- Tree-sitter Rust
        ["@module.rust"] = { fg = palette.variable },
        ["@type.rust"] = { fg = palette.type },
    }

    return groups
end

-- función que aplica todos los grupos
M.apply = function(opts)
    local hl = vim.api.nvim_set_hl
    for group, opts_group in pairs(get_groups(opts)) do
        hl(0, group, no_style(opts_group))
    end
end

return M
