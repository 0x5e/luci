
local netmod = luci.model.network
local interface = luci.model.network.interface
local proto = netmod:register_protocol("gretap")

function proto.get_i18n(self)
	return luci.i18n.translate("GRETAP tunnel over IPv4")
end

function proto.ifname(self)
	return "gretap-" .. self.sid
end

function proto.opkg_package(self)
	return "gre"
end

function proto.is_installed(self)
	return nixio.fs.access("/lib/netifd/proto/gre.sh")
end

function proto.is_floating(self)
	return true
end

function proto.is_virtual(self)
	return true
end

function proto.get_interfaces(self)
	return nil
end

function proto.contains_interface(self, ifc)
	 return (netmod:ifnameof(ifc) == self:ifname())
end

netmod:register_pattern_virtual("^gretap%-%w")
