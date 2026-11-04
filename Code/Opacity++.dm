
#define OPP_MASK_SIZE 256

atom
	plane = MAP_PLANE

overlay
	parent_type = /atom/movable

	opacity
		icon = 'Demo/Map.dmi'
		icon_state = "black"
		plane = SHADOW_PLANE
		layer = 1

	shadow_hider
		icon = 'Demo/Map.dmi'
		icon_state = "black"
		plane = SHADOW_HIDER_PLANE

mob
	verb
		generate_distortion_mask()
			var/icon/i = icon('Generated/Blank.dmi')

			i.Crop(1,1,256,256)
			for(var/y in 1 to 256)
				for(var/x in 1 to 256)
					i.DrawBox(rgb(256 - x,y-1,128),x,y)

			usr << ftp(i, "Distortion Mask.dmi")