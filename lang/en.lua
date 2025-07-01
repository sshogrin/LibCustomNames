local strings = {
    LCI_MENU = "LibCustomIcons",
    LCI_MENU_README = "Readme (Click to open)",
    LCI_MENU_README1 = "Use the settings below to customize your name. It's only a preview, which means nobody will see your changes until you send the generated LUA code to the addon's author.",
    LCI_MENU_README2 = "Click \"%s\" at the top of this menu for more detailed instructions on how to contact the author and get a custom name. Please, only use in-game mails for gold donations. You won't get any replies there!",
    LCI_MENU_HEADER = "my custom name",
    LCI_MENU_NAME_VAL = "Custom name",
    LCI_MENU_NAME_VAL_TT = "You can set a custom name here.",
    LCI_MENU_GRADIENT = "Gradient",
    LCI_MENU_GRADIENT_TT = "Create gradient based on the colors below.",
    LCI_MENU_COLOR1 = "Start color",
    LCI_MENU_COLOR2 = "End color",
    LCI_MENU_PREVIEW = "Preview",
    LCI_MENU_LUA = "LUA code:",
    LCI_MENU_LUA_TT = "Send this code to the addon author.",
}

for id, val in pairs(strings) do
    ZO_CreateStringId(id, val)
    SafeAddVersion(id, 1)
end