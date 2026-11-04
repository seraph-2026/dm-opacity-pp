
#define OPP_MASK_SIZE 256

var/const/MAP_PLANE = -1 // -1 // Actual map
var/const/BLACKNESS_PLANE = 0 // 0 // Anything opaque has a blackness which is stretched to form shadow
var/const/SHADOW_PLANE = -3 // -3 // Shadow plane
var/const/SHADOW_HIDER_PLANE = -2 // -2 // Shows partially behind shadow
var/const/SIGHT_PLANE = 1 // -1


atom
	plane = MAP_PLANE
	
	/**
	 * Public On/Off for Opacity ++
	 * 
	 * Used at compile time
	 */
	var/opacity_pp = 0

	/**
	 * Public On/Off for Opacity ++
	 * 
	 * Used at runtime
	 */
	proc
		opacity_pp_on()
			opacity = 1
			overlays += list(/overlay/opacity, /overlay/shadow_hider)

		opacity_pp_off()
			opacity = 0
			overlays -= list(/overlay/opacity, /overlay/shadow_hider)


	New()
		..()
		if(src.opacity_pp)
			opacity = 1
			overlays += list(/overlay/opacity, /overlay/shadow_hider)
		

overlay
	parent_type = /atom/movable

	/**
	 * The opacity overlays makes the object opaque(solid) in the shadow plane.
	 * 
	 * Put simply this object will now cast a shadow.
	 */
	opacity
		icon = 'Demo/Map.dmi'
		icon_state = "black"
		plane = SHADOW_PLANE
		layer = 1

	/**
	 * Any object that has this overlay will appear behind shadows
	 */
	shadow_hider
		icon = 'Demo/Map.dmi'
		icon_state = "black"
		plane = SHADOW_HIDER_PLANE

mob
	verb
		/**
		 * If you lose your distortion mask or want to see how it's built, you can use this function.
		 * 
		 * Be sure to save output in /Generated folder
		 */
		generate_distortion_mask()
			set hidden = 1

			var/icon/i = icon('Generated/Blank.dmi')

			i.Crop(1,1,256,256)
			for(var/y in 1 to 256)
				for(var/x in 1 to 256)
					i.DrawBox(rgb(256 - x,y-1,128),x,y)

			usr << ftp(i, "Distortion Mask.dmi")