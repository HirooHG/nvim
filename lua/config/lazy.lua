local fn = vim.fn
local opt = vim.opt
local loop = vim.loop

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=main",
    lazypath
  })
end

opt.rtp:prepend(lazypath)

return require('lazy').setup("plugins")
