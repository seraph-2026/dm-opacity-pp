
/**
 * This is the plane where we distort the blackness into the shape of shadows using the distortion mask in /Generated
 */
distortion
	parent_type = /obj
	icon = 'Generated/Distortion Mask.dmi'
	render_target = "*SHADOW_MASK"
	appearance_flags = PIXEL_SCALE
	screen_loc = "MIDDLE,MIDDLE"
	mouse_opacity = 0

client
	var/distortion/distortion = new()
	New()
		. = ..()
		mob.sight |= SEE_BLACKNESS | SEE_TURFS
		screen += new/blackness_plane
		screen += new/shadow_hider_plane
		screen += new/shadow_plane()
		screen += new/sight_plane()
		screen += distortion

		/**
		 * Determines how large we stretch the 256x256 distortion field.
		 */
		var/stretchFactor = 2.375 // Stretches it beyond the edges of the map

		// This will stretch it relative to the largest side of the viewport
		var/viewportFactor =  (max(src.bound_width, src.bound_height) / world.icon_size) / 13
		
		distortion.transform = matrix(stretchFactor * viewportFactor,  MATRIX_SCALE)
