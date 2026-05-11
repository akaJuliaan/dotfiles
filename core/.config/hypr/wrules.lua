--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Ignore maximize requests from all apps.
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Make kitty transparent if not in focus
hl.window_rule({
	match = {
		class = "^(kitty)$",
	},
	opacity = "1 0.95",
})

hl.window_rule({
	match = {
		fullscreen = true,
	},
	border_size = 0,
})

hl.window_rule({
	match = {
		class = "^(org.pulseaudio.pavucontrol)$",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "nmtui",
	},
	float = true,
	size = "500 450",
})
