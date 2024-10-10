Latte = "catppuccin-latte"
Mocha = "catppuccin-mocha"
Frappe = "catppuccin-frappe"
function SetColor(color)
    vim.cmd.colorscheme(color)
end

function ToggleColor()
    if vim.g.colors_name == Latte then
        SetColor(Mocha)
    elseif vim.g.colors_name == Mocha then
        SetColor(Frappe)
    else
        SetColor(Latte)
    end
end

SetColor(Latte)
