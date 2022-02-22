
local map, section, net = ...

local peeraddr, ipaddr, tunlink, mtu, ttl, tos, df, nohostroute, multicast, ikey, okey, icsum, ocsum, iseqno, oseqno

peeraddr = section:taboption("general", Value, "peeraddr", translate("Remote IPv4 address or FQDN"), translate("The IPv4 address or the fully-qualified domain name of the remote tunnel end."))
peeraddr.optional = false
peeraddr.datatype = "or(hostname,ip4addr)"

ipaddr = section:taboption("general", Value, "ipaddr", translate("Local IPv4 address"), translate("The local IPv4 address over which the tunnel is created (optional)."))
ipaddr.optional = true
ipaddr.datatype = "ip4addr"

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

df = section:taboption("advanced", Flag, "df", translate("Don't Fragment"), translate("Enable the DF (Don't Fragment) flag of the encapsulating packets."))
df.default = df.enabled

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
