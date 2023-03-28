return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dap.adapters.python = {
      type = "executable",
      command = "python",
      args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
      {
        -- The first three options are required by nvim-dap
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python"
          end
        end,
      },
    }

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "/home/gino/.local/share/nvim/mason/bin/codelldb", -- adjust as needed, must be absolute path
        args = { "--port", "${port}" },
        -- On windows you may have to uncomment this:
        -- detached = false,
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch File",
        type = "codelldb",
        request = "launch",
        program = function()
          local path = vim.fn.input("Path to executable: " .. vim.fn.getcwd() .. "/")
          if vim.fn.executable(path) == 0 then
            vim.notify("Path " .. " is not executable!")
          end
          return path
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
      },
    }

    -- If you want to use this for rust and c, add something like this:
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,

  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      opts = {
        controls = {
          element = "repl",
          enabled = true,
          icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = "",
          },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        force_buffers = true,
        icons = {
          collapsed = "",
          current_frame = "",
          expanded = "",
        },
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 0.25,
              },
              {
                id = "breakpoints",
                size = 0.25,
              },
              {
                id = "stacks",
                size = 0.25,
              },
              {
                id = "watches",
                size = 0.25,
              },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              {
                id = "repl",
                size = 0.5,
              },
              {
                id = "console",
                size = 0.5,
              },
            },
            position = "bottom",
            size = 10,
          },
        },
        mappings = {
          edit = "e",
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t",
        },
        render = {
          indent = 1,
          max_value_lines = 100,
        },
      },
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {
        highlight_new_as_changed = true, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        commented = true, -- prefix virtual text with comment string
        all_references = true, -- show virtual text on all all references of the variable (not only definitions)
        all_frames = true, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      },
    },
  },

  init = function()
    require("utils").create_keymap_group("<leader>d", "+dap")
  end,

  keys = {
    { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "Continue" },
    { "<leader>do", "<cmd>lua require('dap').over()<cr>", desc = "Step over" },
    { "<leader>di", "<cmd>lua require('dap').into()<cr>", desc = "Step into" },
    { "<leader>dq", "<cmd>lua require('dap').out()<cr>", desc = "Step out" },
    { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle repl" },
    { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "Run last" },
    { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle ui" },
    { "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate" },
    { "<leader>dk", "<cmd>lua require('dap.ui.widgets').hover()<cr>", desc = "hover" },
  },
}
