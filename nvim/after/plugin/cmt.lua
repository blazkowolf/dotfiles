-- NERDCommenter waste
vim.g.NERDCreateDefaultMappings = 1  -- Create default mappings
vim.g.NERDSpaceDelims = 1            -- Add spaces after comment delimiters by default
vim.g.NERDCompactSexyComs = 1        -- Use compact syntax for prettified multi-line comments
vim.g.NERDDefaultAlign = "left"      -- Align line-wise comment delimiters flush left instead of following code indentation
vim.g.NERDAltDelims_java = 1         -- Set a language to use its alternate delimiters by default
vim.g.NERDCommentEmptyLines = 1      -- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDTrimTrailingWhitespace = 1 -- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDToggleCheckAllLines = 1    -- Enable NERDCommenterToggle to check all selected lines is commented or not 
-- Add your own custom formats or override the defaults
vim.g.NERDCustomDelimiters = {
  ["c"] = {
    ["left"] = "/**",
    ["right"] = "*/"
  }
}
