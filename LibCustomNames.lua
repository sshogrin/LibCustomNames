--- @class LibCustomNames
local lib = {
    name = "LibCustomNames",
    version = "dev",
    author = "@m00nyONE",
}

local lib_debug = false
local lib_name = lib.name
local lib_author = lib.author
local lib_version = lib.version
_G[lib_name] = lib

local EM = EVENT_MANAGER

--- @class nameEntry
--- @field name string
--- @field coloredName string

--- @type table<string, nameEntry> Table mapping `@accountName` to `{ uncoloredName, coloredName }`
local names = {}

--- Returns a read-only proxy table
local function readOnly(t)
    local proxy = {}
    local metatable = {
        --__metatable = "no indexing allowed",
        __index = t,
        __newindex = function(_, k, v)
            d("attempt to update read-only table")
        end,
    }
    setmetatable(proxy, metatable)
    return proxy
end

--- Returns a reference to the internal names table.
--- This is only available during addon initialization, to disallow other addons tampering with the data later.
--- @return table<string, nameEntry> The table of custom names.
function lib.GetNamesTable()
    return names
end

--- Internal function to perform post-load initialization.
--- Clears temporary helper functions from the public API.
local function initialize()
    if not lib_debug then
        -- remove GetNamesTable function
        lib.GetNamesTable = nil
    end

    lib.BuildMenu()

    -- make the Lib read-only
    _G[lib_name] = readOnly(lib)
end

--- Register for the EVENT_ADD_ON_LOADED event to initialize the addon properly.
EM:RegisterForEvent(lib_name, EVENT_ADD_ON_LOADED, function(_, name)
    if name ~= lib_name then return end

    initialize()

    EM:UnregisterForEvent(lib_name, EVENT_ADD_ON_LOADED)
end)

--- Opens the in-game mail window with donation fields prefilled for supporting the library.
function lib.Donate()
    SCENE_MANAGER:Show('mailSend')
    zo_callLater(function()
        ZO_MailSendToField:SetText(lib_author)
        ZO_MailSendSubjectField:SetText("Donation for " .. lib_name)
        ZO_MailSendBodyField:SetText("")
        ZO_MailSendBodyField:TakeFocus()
    end, 250)
end

--- Handles slash commands for version output and donation prompt.
--- Usage:
--- - `/lcn version` — shows current version
--- - `/lcn donate` — opens mail window for donations
--- @param str string The argument passed with the slash command
local function slashCommands(str)
    if str == "version" then d(lib_version) end
    if str == "donate" then lib.Donate() end
end

--- Register slash commands for interacting with the library.
SLASH_COMMANDS["/LibCustomNames"] = slashCommands
SLASH_COMMANDS["/lcn"] = slashCommands