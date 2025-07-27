  return {
     dir = "~/pet/rpc.nvim", -- path to your plugin
     name = "rpc",
     config = function()
       vim.api.nvim_create_user_command('RpcStart', function()
         require('rpc').start_server()
       end, {})

       vim.api.nvim_create_user_command('RpcStop', function()
         require('rpc').stop_server()
       end, {})

       vim.api.nvim_create_user_command('RpcSend', function()
         require('rpc').send()
       end, {})
     end,
   }
