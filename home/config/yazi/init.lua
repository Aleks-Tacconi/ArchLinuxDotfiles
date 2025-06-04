require("no-status"):setup()

Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Span(" " .. ya.user_name() .. "@" .. ya.host_name() .. ": "):fg("white")
end, 500, Header.LEFT)
