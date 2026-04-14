-- Standalone plugins with less than 10 lines of config go here

require('nvim-ts-autotag').setup()
require('nvim-autopairs').setup()
require('colorizer').setup()
require('todo-comments').setup()

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
