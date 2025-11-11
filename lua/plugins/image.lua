return {
 "3rd/image.nvim",
 dependencies = { "luarocks.nvim" },
 config = function()
   require("image").setup({
     backend = "kitty",
     hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
     scale_factor = 2.0,
   })
 end
}
