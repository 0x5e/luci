
local map, section, net = ...

local peer6addr, ip6addr, tunlink, mtu, ttl, tos, nohostroute, multicast, ikey, okey, icsum, ocsum, iseqno, oseqno

peer6addr = section:taboption("general", Value, "peer6addr", translate("Remote IPv6 address or FQDN"), translate("The IPv6 address or the fully-qualified domain name of the remote tunnel end."))
peer6addr.optional = false
peer6addr.datatype = "or(hostname,ip6addr)"

ip6addr = section:taboption("general", Value, "ip6addr", translate("Local IPv6 address"), translate("The local IPv6 address over which the tunnel is created (optional)."))
ip6addr.optional = true
ip6addr.datatype = "ip6addr"

tunlink = section:taboption("general", Value, "tunlink", translate("Bind interface"), translate("Bind the tunnel to this interface (optional)."))
tunlink.optional = true


mtu = section:taboption("advanced", Value, "mtu", translate("Override MTU"), translate("Specify an MTU (Maximum Transmission Unit) other than the default (1280 bytes)."))
mtu.optional = true
mtu.placeholder = 1280
mtu.datatype = "range(68, 9200)"

ttl = section:taboption("advanced", Value, "ttl", translate("Override TTL"), translate("Specify a TTL (Time to Live) for the encapsulating packet other than the default (64)."))
ttl.optional = true
ttl.placeholder = 64
ttl.datatype = "min(1)"

tos = section:taboption("advanced", Value, "tos", translate("Override TOS"), translate("Specify a TOS (Type of Service)."))
tos.optional = true
tos.datatype = "range(0, 255)"

nohostroute = section:taboption("advanced", Flag, "nohostroute", translate("No host route"), translate("Do not create host route to peer (optional)."))
nohostroute.optional = true

multicast = section:taboption("advanced", Flag, "multicast", translate("Multicast"), translate("Enable support for multicast traffic (optional)."))
multicast.optional = true

ikey = section:taboption("advanced", Value, "ikey", translate("Incoming key"), translate("Key for incoming packets (optional)."))
ikey.optional = true
ikey.datatype = "integer"

okey = section:taboption("advanced", Value, "okey", translate("Outgoing key"), translate("Key for outgoing packets (optional)."))
okey.optional = true
okey.datatype = "integer"

icsum = section:taboption("advanced", Flag, "icsum", translate("Incoming checksum"), translate("Require incoming checksum (optional)."))
icsum.optional = true

ocsum = section:taboption("advanced", Flag, "ocsum", translate("Outgoing checksum"), translate("Require outgoing checksum (optional)."))
ocsum.optional = true

iseqno = section:taboption("advanced", Flag, "iseqno", translate("Incoming serialization"), translate("Require incoming packets serialization (optional)."))
iseqno.optional = true

oseqno = section:taboption("advanced", Flag, "oseqno", translate("Outgoing serialization"), translate("Require outgoing packets serialization (optional)."))
oseqno.optional = true
