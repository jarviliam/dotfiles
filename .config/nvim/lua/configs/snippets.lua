--Snippets Config -- snippets.nvim
local snip_plug = require('snippets')
local indent = require('snippets.utils').match_indentation

local snippets = {}

snippets._global = {
    ["todo"] = "TODO(jarviliam): ",
    ["date"] = [[${=os.date("%Y-%m-%d")}]],
    ["rString"] = [[${=RandomString(15)}]],
    ["cmake"] = [[
cmake_minimum_required(VERSION 3.8)
project(${1:projname}
DESCRIPTION "${2:description}"
HOMEPAGE_URL https://github.com/jarviliam/${3:reponame}
LANGUAGES CXX)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)]]
}

--SNIPPETS FOR GOLANG
snippets.go = {}
snippets.go.err = indent [[
if err != nil {
    returns$0
}]]
snippets.go.mfile = [[
package main

func main(){
    $0
}]]
snippets.go.func = [[
func $1 {
    $0
}
]]

snip_plug.snippets = snippets
snip_plug.use_suggested_mappings()

local charset = {}
do -- [0-9a-zA-Z]
    -- for c = 48, 57  do table.insert(charset, string.char(c)) end
    for c = 65, 90  do table.insert(charset, string.char(c)) end
    for c = 97, 122 do table.insert(charset, string.char(c)) end
    table.insert(charset, " ")
    table.insert(charset, " ")
    table.insert(charset, " ")
    table.insert(charset, " ")
    table.insert(charset, " ")
    table.insert(charset, " ")
end

function RandomString(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.clock()^5)
    return RandomString(length - 1) .. charset[math.random(1, #charset)]
end
