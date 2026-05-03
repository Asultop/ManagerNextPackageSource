local usercmd = {
    "input_img_temp_enable",
    "input_img_temp_disable",
    "voicerecord",
    "sprint",
    "reload",
    "attack",
    "attack2",
    "turnleft",
    "turnright",
    "turnup",
    "turndown",
    "forward",
    "back",
    "left",
    "right",
    "moveup",
    "movedown",
    "klook",
    "use",
    "jump",
    "duck",
    "strafe",
    "campitchup",
    "campitchdown",
    "camyawleft",
    "camyawright",
    "camin",
    "camout",
    -- "yaw",
    -- "pitch",
    -- "forwardback",
    -- "rightleft",
    "showscores",
    "zoom",
    "lookatweapon"
}
local part0 = math.floor(#usercmd / 4)
local part1 = part0*2
local part2 = part0*3
-- local general = assert(io.open("usercmd\\general.cfg", "w"))
-- local mirror = assert(io.open("usercmd\\mirror.cfg", "w"))
-- local async = assert(io.open("usercmd\\async.cfg", "w"))
local method = assert(io.open("usercmd\\method.cfg", "w"))
-- local custom = assert(io.open("usercmd\\custom.cfg", "w"))
local async_press_prefix = "="
local async_release_prefix = "_"
local internal_press_prefix = "<"
local internal_release_prefix = ">"
local external_press_prefix = "++"
local external_release_prefix = "--"
local unflagged_name = "$"
local unflagged_exec = "#"
local text = ""




-- for i = 1, #usercmd do
--     local k = usercmd[i]
--     text = text .. string.format("alias +%s %s 1 0 0;alias -%s %s -32767 0 0", k, k, k, k) .. "\n"
-- end
-- general:write(text)
-- general:close()
-- text = ""
-- for i = 1,#usercmd do
--     local k = usercmd[i]
--     text = text .. string.format("alias +%s \"alias %s +in_%s;%s\";alias -%s \"alias %s -in_%s;%s\"", k, unflagged_name, k, unflagged_exec, k, unflagged_name, k, unflagged_exec) .. "\n"
-- end
-- mirror:write(text)
-- mirror:close()




-- text = "alias async_usercmd \"async_usercmd0;async_usercmd1\"\nalias async_usercmd0 \""
-- for i = 1, part1 do
--     text = text .. string.format("%s%s;%s%s;",async_press_prefix, i, async_release_prefix, i)
-- end
-- text = text .. "\"\nalias async_usercmd1 \""
-- for i = part1+1, #usercmd do
--     text = text .. string.format("%s%s;%s%s;",async_press_prefix, i, async_release_prefix, i)
-- end
-- text = text .. "\"\n"

-- text = text .. "alias async_usercmd_reset \"async_usercmd_reset0;async_usercmd_reset1;async_usercmd_reset2;async_usercmd_reset3\""
-- text = text .. "\nalias async_usercmd_reset0 \""
-- for i = 1, part1 do
--     text = text .. string.format("alias %s%s;",async_press_prefix, i)
-- end
-- text = text .. "\"\nalias async_usercmd_reset1 \""
-- for i = part1+1, #usercmd do
--     text = text .. string.format("alias %s%s;",async_press_prefix, i)
-- end
-- text = text .. "\"\nalias async_usercmd_reset2 \""
-- for i = 1, part1 do
--     text = text .. string.format("alias %s%s;",async_release_prefix, i)
-- end
-- text = text .. "\"\nalias async_usercmd_reset3 \""
-- for i = part1+1, #usercmd do
--     text = text .. string.format("alias %s%s;",async_release_prefix, i)
-- end
-- text = text .. "\"\n"
-- for i = 1, #usercmd do
--     local k = usercmd[i]
--     text = text .. string.format("alias %s%s \"%s 1 0 0;alias %s%s\";alias %s%s \"%s -32767 0 0;alias %s%s\"", 
--     internal_press_prefix, 
--     k, 
--     k, 
--     async_press_prefix, 
--     i, 
--     internal_release_prefix,
--     k, 
--     k, 
--     async_release_prefix, 
--     i
--     ) .. "\n"
-- end
-- for i = 1, #usercmd do
--     local k = usercmd[i]
--     text = text .. string.format("alias %s%s alias %s%s %s%s;alias %s%s alias %s%s %s%s", 
--     external_press_prefix, 
--     k, 
--     async_press_prefix, 
--     i, 
--     internal_press_prefix, 
--     k, 
--     external_release_prefix, 
--     k, 
--     async_release_prefix, 
--     i, 
--     internal_release_prefix, 
--     k
--     ) .. "\n"
-- end
-- async:write(text)
-- async:close()




text = "alias in_method_reset \"in_method_reset0;in_method_reset1;in_method_reset2;in_method_reset3\"\nalias in_method_reset0 \""
for i = 1, part0 do
    local k = usercmd[i]
    text = text .. string.format("alias in.%s 0;", k)
end
text = text .. "\"\nalias in_method_reset1 \""
for i = part0+1, part1 do
    local k = usercmd[i]
    text = text .. string.format("alias in.%s 0;", k)
end
text = text .. "\"\nalias in_method_reset2 \""
for i = part1+1, part2 do
    local k = usercmd[i]
    text = text .. string.format("alias in.%s 0;", k)
end
text = text .. "\"\nalias in_method_reset3 \""
for i = part2+1, #usercmd do
    local k = usercmd[i]
    text = text .. string.format("alias in.%s 0;", k)
end
text = text .. "\"\nin_method_reset\n"
for i = 1, #usercmd do
    local k = usercmd[i]
    text = text .. string.format("alias +in_%s \"alias in.%s 1;%s+\"", k, k, k) .. "\n"
    text = text .. string.format("alias -in_%s \"alias in.%s 0;%s-\"", k, k, k) .. "\n"
end
for i = 1, #usercmd do
    local k = usercmd[i]
    text = text .. string.format("alias %s+ \"alias .%s 1;%s 1 0 0\"", k, k, k) .. "\n"
    text = text .. string.format("alias %s- \"alias .%s 0;%s -32767 0 0\"", k, k, k) .. "\n"
end
method:write(text)
method:close()


-- text = "alias tr_method_reset \"tr_method_reset0;tr_method_reset1;tr_method_reset2;tr_method_reset3\"\nalias tr_method_reset0 \""
-- for i = 1, part0 do
--     local k = usercmd[i]
--     text = text .. string.format("alias in.%s 0;", k)
-- end
-- text = text .. "\"\nalias tr_method_reset1 \""
-- for i = part0+1, part1 do
--     local k = usercmd[i]
--     text = text .. string.format("alias in.%s 0;", k)
-- end
-- text = text .. "\"\nalias tr_method_reset2 \""
-- for i = part1+1, part2 do
--     local k = usercmd[i]
--     text = text .. string.format("alias in.%s 0;", k)
-- end
-- text = text .. "\"\nalias tr_method_reset3 \""
-- for i = part2+1, #usercmd do
--     local k = usercmd[i]
--     text = text .. string.format("alias in.%s 0;", k)
-- end
-- text = text .. "\"\ntr_method_reset\n"
-- for i = 1, #usercmd do
--     local k = usercmd[i]
--     text = text .. string.format("alias +tr_%s \"\"", k, k) .. "\n"
--     text = text .. string.format("alias -tr_%s \"\"", k, k) .. "\n"
-- end
-- custom:write(text)
-- custom:close()