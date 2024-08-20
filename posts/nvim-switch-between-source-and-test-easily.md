---
title: "Switch easily between source code and test in neovim"
---

When you have a project structure like this

```
src/
    helloworld/
        hello.gleam
test/
    helloworld/
        hello_test.gleam
```

This keymap below can help you switch between `hello.gleam` and `hello_test.gleam` easily.
Your test file is just <kbd>leader+n</kbd> away!

```lua
-- Switch between source and test file
vim.keymap.set('n', '<leader>n', function()
    local file_path = vim.fn.expand('%')
    local src_pattern = "/src/"
    local test_pattern = "/test/"

    if file_path:match(src_pattern) then
        local test_path = file_path:gsub(src_pattern, "/test/"):gsub("(%..*)$",
                                                                     "_test%1")
        vim.cmd("edit " .. test_path)
    elseif file_path:match(test_pattern) then
        local src_path = file_path:gsub(test_pattern, "/src/"):gsub(
                             "_test(%..*)$", "%1")
        vim.cmd("edit " .. src_path)
    else
        print("Not a source or test file")
    end
end, {noremap = true, silent = true})
```
