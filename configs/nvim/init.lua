-- bootstrap lazy.nvim, LazyVim and your plugins
vim.env.JAVA_HOME = "/usr/lib/jvm/java-21-openjdk-amd64/"
vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH
vim.opt.clipboard = "unnamedplus"
require("config.lazy")
