local strings = {
    LCN_MENU = "LibCustomNames",
    LCN_MENU_README = "Readme (Click to open)",
    LCN_MENU_README1 = "Use the settings below to customize your name. It's only a preview, which means nobody will see your changes until you send the generated LUA code to the addon's author.",
    LCN_MENU_README2 = "Click \"%s\" at the top of this menu for more detailed instructions on how to contact the author and get a custom name. Please use the in-game mail system for gold donations only. You won't get any replies there regarding icon requests!",
    LCN_MENU_HEADER = "my custom name",
    LCN_MENU_NAME_VAL = "Custom name",
    LCN_MENU_NAME_VAL_TT = "You can set a custom name here.",
    LCN_MENU_GRADIENT = "Gradient",
    LCN_MENU_GRADIENT_TT = "Create gradient based on the colors below.",
    LCN_MENU_COLOR1 = "Start color",
    LCN_MENU_COLOR2 = "End color",
    LCN_MENU_PREVIEW = "Preview",
    LCN_MENU_LUA = "LUA code:",
    LCN_MENU_LUA_TT = "Send this code to the addon author.",
}

for id, val in pairs(strings) do
    ZO_CreateStringId(id, val)
    SafeAddVersion(id, 1)
end