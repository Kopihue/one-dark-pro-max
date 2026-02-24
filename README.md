# One-Dark-Pro-Max Colorscheme
## A clon of Zed editor one-dark-pro-max colorscheme for neovim

# Installation
### Example using Lazy

```lua
return {
    "Kopihue/one-dark-pro-max",
    name = "one-dark-pro-max",
    config = function()
        vim.cmd("colorscheme one-dark-pro-max")
    end
}
```

# Gallery
<img width="1903" height="1034" alt="image" src="https://github.com/user-attachments/assets/cad2a675-f3a2-4dfb-8b58-b897cca478a2" />

<img width="1869" height="1002" alt="image" src="https://github.com/user-attachments/assets/f48eb14a-0417-4407-90bf-78e8da131471" />


# Configuration

```lua
require("one-dark-pro-max").setup({
    transparency = false,
    bold = true,
    italic = true,
})
```

# Note about lsp
Lsp will highlight the words in the buffer if you don't deactivate that feature, to deativate it put this in you init.lua
```lua
-- disable lsp syntax highlighting
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
	local client = vim.lsp.get_client_by_id(args.data.client_id)
	if client then
	    client.server_capabilities.semanticTokensProvider = nil
	end
    end,
})
```
