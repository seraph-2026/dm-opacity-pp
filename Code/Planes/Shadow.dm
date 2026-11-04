
shadow_plane
	parent_type = /obj
	plane = SHADOW_PLANE
	appearance_flags = PLANE_MASTER
	screen_loc = "SCREEN_SOUTHWEST"
	render_target = "*SHADOW_PLANE"

	New()
		var/i
		for(i in 1 to 4)
			filters += filter(type="displace",size=i,render_source="*SHADOW_MASK",flags=FILTER_OVERLAY)

		for(i in 8 to 128 step 8)
			filters += filter(type="displace",size=i,render_source="*SHADOW_MASK",flags=FILTER_OVERLAY)

