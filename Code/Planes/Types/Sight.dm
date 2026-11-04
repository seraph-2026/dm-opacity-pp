
sight_plane
	parent_type = /obj
	plane = SIGHT_PLANE
	screen_loc = "SCREEN_SOUTHWEST"
	render_source = "*SHADOW_PLANE"
	alpha = 25

	New()
		var/i
		for(i in 80 to 192 step 16)
			filters += filter(type="displace",size=i,render_source="*SHADOW_MASK",flags=FILTER_OVERLAY)

		filters += filter(type="radial_blur",size=1/32)

		filters += filter(type="layer",render_source="*SHADOW_PLANE")

		filters += filter(type="color",color=list(0,0,0,0,
												  0,0,0,0,
												  0,0,0,0,
												  0,0,0,1,
												  0,0,0,-31/32))

		filters += filter(type="color",color=list(0,0,0,0,
												  0,0,0,0,
												  0,0,0,0,
												  0,0,0,32,
												  0,0,0,0))

		filters += filter(type="alpha",render_source="*SHADOW_HIDER",flags=MASK_INVERSE)
