-- For handling Bluetooth

local ldbus = require "ldbus"
local conn = assert( ldbus.bus.get("session") )
print("Testing")

local msg = assert(ldbus.message.new_method_call("org.bluez", "/", "org.freedesktop.DBus.ObjectManager","GetManagedObjects"))
local iter = ldbus.message.iter.new()
msg:iter_init_append(iter)

local reply = assert(conn:send_with_reply_and_block(msg))

if reply == nil then
    print("Nil")
else
    print(reply)
end
