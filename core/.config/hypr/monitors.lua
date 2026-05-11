------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "",
	mode = "highres",
	position = "auto",
	scale = "auto",
})

-- Mirror HDMI displays (for presentations)
-- TODO: Test if this really works?
hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "auto",
	scale = "auto",
	mirror = "eDP-1",
})
