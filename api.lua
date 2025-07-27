local lib_name = "LibCustomNames"
local lib = _G[lib_name]
local n = lib.GetNamesTable()

--- function that creates a deep copy of a table
local function clone(t)
    local copy = {}
    for k, v in pairs(t) do
        copy[k] = v
    end
    return copy
end

--- Checks whether a custom name exists for the given username.
--- @param username string The player's account name (e.g., "@m00nyONE").
--- @return boolean hasCustomName `true` if a custom name exists, `false` otherwise.
function lib.HasCustomName(username)
    --if n[string.lower(username)] then
    if n[username] then
        return true
    end

    return false
end

--- Retrieves the custom name for a given username.
---
--- If `colored` is `true` or `nil`, the colored version will be returned.
--- If `colored` is `false`, the uncolored version will be returned.
--- Falls back to the uncolored version if the colored one is missing.
---
--- @param username string The player's account name (e.g., "@m00nyONE").
--- @param colored boolean|nil Whether to return the colored name. Defaults to `true`.
--- @return string|nil customName The custom name if it exists, or `nil` otherwise.
function lib.Get(username, colored)
    --local entry = n[string.lower(username)]
    local entry = n[username]
    if not entry then return nil end

    if colored == false then
        return entry[1]
    else
        return entry[2] or entry[1]
    end
end

--- Retrieves the colored custom name for a given username.
---
--- @param username string The player's account name (e.g., "@m00nyONE").
--- @return string|nil customName The custom name if it exists, or `nil` otherwise.
function lib.GetColoredName(username)
    return lib.Get(username, true)
end

--- Retrieves the uncolored custom name for a given username.
---
--- @param username string The player's account name (e.g., "@m00nyONE").
--- @return string|nil customName The custom name if it exists, or `nil` otherwise.
function lib.GetUncoloredName(username)
    return lib.Get(username, false)
end

--- Retrieves all custom names from the internal table as a deep copy.
--- Editing the returning table has no effect to the internal one that is used to retrieve actual names.
---
--- @return table<string, nameEntry>
function lib.GetAllNames()
    return clone(n)
end