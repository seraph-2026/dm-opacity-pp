/*
	These are simple defaults for your project.
 */

world
	fps = 25		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = "15x15"
	// 9x9 lowest functioning

mob
	icon = 'Player.dmi'

	Click()
		world << "Clicked"


obj
	icon = 'Player.dmi'

turf
	icon = 'Map.dmi'

	Click(location,control,params)
		new/turf/wall(src)

	wall
		icon_state = "wall"
		overlays = list(/overlay/opacity, /overlay/shadow_hider)
		opacity = 1
		density = 1

		verb
			test()
				set src in view(20)
				world << "test"

		Click(location,control,params)
			if(src in view(20)) // This works
				new/turf(src)

