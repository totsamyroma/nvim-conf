require("lensline").setup({
  -- Profile definitions, first is default
  profiles = {
    {
      name = "basic",
      providers = {
        { name = "usages", enabled = true, include = { "refs" }, breakdown = false },
        { name = "last_author", enabled = true }
      },
      style = { render = "all", placement = "above" }
    },
    {
      name = "informative",
      providers = {
        { name = "usages", enabled = true, include = { "refs", "defs", "impls" }, breakdown = true },
        { name = "diagnostics", enabled = true, min_level = "HINT" },
        { name = "complexity", enabled = true }
      },
      style = { render = "focused", placement = "inline" }
    }
  },
})
