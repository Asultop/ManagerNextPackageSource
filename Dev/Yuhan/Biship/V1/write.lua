local level = 31
local bit = 2^ level
local convar = "cl_buymenu_ct_nextround_high"
local file = assert(io.open(convar .. "_w.cfg", "w"))
local index = 0
local text = ""

level = level - 1

for i = level, 0, -1 do

  bit = math.floor(bit)

  text = text .. (string.format("alias w%d^%d \"alias 0 incremenvar %s 0 2147483647 %d;alias 1 incremenvar %s 0 2147483647 -%d;%d^%d\"", index, i, convar, bit, convar, bit, index, i)) .. "\n"

  bit = bit//2
end

file:write(text)
file:close()