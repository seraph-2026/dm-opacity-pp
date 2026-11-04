
/**
 * Creates cut outs in the shadow plane to allow us to see what's underneath
 */
shadow_hider_plane
	parent_type = /obj
	plane = SHADOW_HIDER_PLANE
	appearance_flags = PLANE_MASTER
	screen_loc = "SCREEN_SOUTHWEST"
	render_target = "*SHADOW_HIDER"

	New()
		filters += filter(type="alpha",render_source="*BLACKNESS_PLANE",flags=MASK_INVERSE)

