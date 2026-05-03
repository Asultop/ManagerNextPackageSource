local name = {
  "Any",
  "Primary",
  "Secondary",
  "Knife",
  "Grenades",
  "C4",
  "HEGrenade",
  "Flashbang",
  "SmokeGrenade",
  "DecoyGrenade",
  "Molotov",
  "Taser",
  "HealthBoost",
  "Unknown"
}
local text = ""


-- text = "alias loadout_reset \""
-- for i = 1, #name do
--     text = text .. "alias slot." .. name[i] .. " 0;"
-- end
-- text = text .. "\"\n"

for i = 1, #name do
    local s = i - 1
    local n = name[i]
    text = text .. string.format("alias loadout%d \"slot_begin;alias slot.Slot %d;alias 0 loadout_new;alias 1 loadout_add;slot.%s;alias slot.%s 1;alias slot.Reset alias slot.%s 0;setsave%d;special%d;slot_end\"", s, s, n, n, n, s, s) .. "\n"
end

for i = 1, #name do
    local s = i - 1
    local n = name[i]
    text = text .. string.format("alias setsave%d \"alias slot.SetSaved alias slot.Saved %d;alias slot.SetSavedCmd alias slot.SavedCmd loadout%d\"", s, s, s) .. "\n"
end

for i = 1, #name do
    local s = i - 1
    text = text .. string.format("alias special%d \"alias slot.Command slot%d;alias slot.Event weapon%d;slot.Group.Restrict\"", s, s, s) .. "\n"
end

for i = 1, #name do
    local s = i - 1
    local n = name[i]
    text = text .. string.format("alias weapon%d \"biship.%s\"", s, n) .. "\n"
end


io.popen('clip', 'w'):write(text):close()