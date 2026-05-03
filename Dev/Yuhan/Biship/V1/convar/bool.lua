local convar = "cl_prefer_lefthanded"
local folder = "convar"
local file = assert(io.open(folder .. "/" .. convar .. ".cfg", "w"))
file:write(string.format("toggle %s \";0\" 1 \";1\"", convar))
file:close()

io.popen('clip', 'w'):write(string.format("alias cvar.%s exec biship/%s/%s", convar, folder, convar)):close()