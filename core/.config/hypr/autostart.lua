-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & awww-daemon & hypridle & swayosd-server & nm-applet --indicator")

	-- Auto-mount removable storage
	hl.exec_cmd("udiskie")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- Clipboard History
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- TODO: Low battery warning?
end)
