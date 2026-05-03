local level = 31
local bit = 2^ level
local index = 0
local convar = "cl_buymenu_ct_nextround_high"
local method = "exec cs2_user_convars_0_slot3.vcfg USRLOCAL"
local file = assert(io.open(convar .. "_r.cfg", "w"))
local add = ""
local text = ""

level = level - 1
text = "alias i " .. method .. "\n"

for i = level, 0, -1 do

  bit = math.floor(bit)

  local dec = string.format("incrementvar %s -1 2147483648 -%d", convar, bit)
  text = text .. ("i") .. "\n"
  if (add ~= "") then 
    text = text .. (add)  .. "\n"
  end
  text = text .. (dec) .. "\n"
  --print("alias ^" .. i)
  text = text .. string.format("toggle %s \";\" -2147483648 -1 -1;toggle %s \";alias ^%d %s;echoln %d^%d: 1\" -1 \";alias ^%d;echoln %d^%d: 0\"", convar, convar, i, dec, index, i, i, index, i) .. "\n"


  bit = bit//2
  add = add .. ";^" .. i
end

file:write(text)
file:close()
--print(text)
--io.popen('clip', 'w'):write(text):close()
