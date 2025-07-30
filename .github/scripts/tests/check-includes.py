import os
import sys

NAMES_DIR = "names"
ADDON_FILE = "LibCustomNames.addon"

def get_lua_files_from_folder(folder):
    return sorted([
        f for f in os.listdir(folder)
        if f.endswith(".lua") and os.path.isfile(os.path.join(folder, f))
    ])

def get_listed_icon_files_from_addon(addon_path):
    listed_files = []
    with open(addon_path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if line.startswith("names/") and line.endswith(".lua"):
                listed_files.append(line.split("/")[-1])
    return sorted(listed_files)

def main():
    local_names = get_lua_files_from_folder(NAMES_DIR)
    listed_names = get_listed_icon_files_from_addon(ADDON_FILE)

    missing_in_addon = sorted(set(local_names) - set(listed_names))
    extra_in_addon = sorted(set(listed_names) - set(local_names))

    if not missing_in_addon and not extra_in_addon:
        print("::notice:: ✅ All name .lua files are included in LibCustomNames.addon")
        sys.exit(0)
    else:
        if missing_in_addon:
            print("::error:: ❌ Missing in .addon file:")
            for name in missing_in_addon:
                print(f"  names/{name}")
            sys.exit(1)
        if extra_in_addon:
            print("::warning:: ❌ Listed in .addon file but missing on disk:")
            for name in extra_in_addon:
                print(f"  names/{name}")
            sys.exit(1)

if __name__ == "__main__":
    main()