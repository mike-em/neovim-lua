local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

dashboard.section.header.val = {
  [[         ////                                ///         ]],
  [[(%%      //////                            /////       %/]],
  [[(%%%%    /////////                      ////////     %%%/]],
  [[(%%%%%%% ///////////                  //////////  %%%%%%/]],
  [[(%%%%%%% //////////////            ///////////  %%%%%%%%/]],
  [[(%%%%%%% ////////////////        /////////// %%%%%%%%%%%/]],
  [[(%%%%%%% ///////  //////////  //////////   %%%%%%%%%%%%%/]],
  [[(%%%%%%  /////// %   ////////////////   %%%%%%%%%%%%%%%%/]],
  [[(%%%%%%  /////// %%%   ////////////   %%%%%%%%%   %%%%%%/]],
  [[(%%%%%%  /////// %%%%%%   //////   %%%%%%%%%% //  %%%%%%/]],
  [[(%%%%%%  /////// %%%%%%%%   //   %%%%%%%%%  ////  %%%%%%/]],
  [[(%%%%%%  ///////  %%%%%%%%%%  %%%%%%%%%% ///////  %%%%%%/]],
  [[(%%%%%%  ///////     %%%%%%%%%%%%%%%%    ///////  %%%%%%/]],
  [[(%%%%%%  ///////       %%%%%%%%%%%%      ///////  %%%%%%/]],
  [[(%%%%%%  ///////          %%%%%%         ///////  %%%%%%/]],
  [[(%%%%%%  ///////            %%           ///////  %%%%%%/]],
}

-- dashboard.section.header.val = {
-- 	[[                               __                ]],
-- 	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
-- 	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
-- 	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
-- 	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
-- 	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- }

dashboard.section.buttons.val = {
  button("f", " Find file", ":Telescope find_files <CR>"),
  button("t", " Find text", ":Telescope live_grep <CR>"),
  button("r", " Recent files", ":Telescope oldfiles <CR>"),
  button("e", " Open Nerd Tree", ":NvimTreeOpen <CR>"),
  button("c", " Config", ":e ~/.config/nvim/init.lua <CR>"),
  button("q", " Quit", ":qa<CR>"),
}
local function footer()
  return "mikem.io"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
