local total = 10000
local per_file = 100
local file_count = total / per_file
local alias = assert(io.open("yaw\\alias.cfg", "w"))
local text = "sv_cheats 1" .. "\n"

os.execute('del /Q "yaw\\*"')

for i = 1, file_count do
    local filename = i .. ".cfg"
    local f = assert(io.open("yaw\\" .. filename, "w"))

    local start_num = (i - 1) * per_file + 1
    local end_num = i * per_file

    local buffer = {}
    for n = start_num, end_num do
        table.insert(buffer, string.format("alias %d.000000 \"yaw %d 1 0;yaw+\";alias -%d.000000 \"yaw -%d 1 0;yaw-\"",n, n, n, n))
    end

    f:write(table.concat(buffer, "\n"))
    f:close()

    text = text .. "exec_async biship\\yaw\\" .. i .. "\n"
end


alias:write(text)
alias:close()