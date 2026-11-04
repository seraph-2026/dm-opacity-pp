
world
	fps = 25
	icon_size = 32	
	view = "15x15" // 9x9 lowest functioning

mob
	icon = 'Player.dmi'

	Login()
		..()
		world << "Click anywhere on the ground to place a wall"
		world << "\nThen click on any walls to delete them"

obj
	icon = 'Player.dmi'

turf
	icon = 'Map.dmi'

	// Click on the ground to place a wall tile
	Click(location,control,params)
		new/turf/wall(src)

	wall
		icon_state = "wall"
		overlays = list(/overlay/opacity, /overlay/shadow_hider)
		opacity = 1
		density = 1

		// Click on a wall tile to delete it
		Click(location,control,params)
			if(src in view(20)) // This works
				new/turf(src)

