/proc/get_organ_blocker(mob/user, location = BODY_ZONE_CHEST)
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		for(var/obj/item/clothing/equipped_item in carbon_user.get_equipped_items(include_pockets = FALSE))
			if(zone2covered(location, equipped_item.body_parts_covered))
				//skips bra items if the location we are looking at is groin
				//if(equipped_item.is_bra && location == BODY_ZONE_PRECISE_GROIN)
				//	continue
				return equipped_item
#define MAX_RANGE_FIND 32

// blocks
// taken from /mob/living/carbon/human/interactive/
/mob/living/carbon/human/proc/walk2derpless(target)
	if(!target || IsStandingStill())
		back_to_idle()
		return 0

	var/dir_to_target = get_dir(src, target)
	var/turf/turf_of_target = get_turf(target)
	if(!turf_of_target)
		back_to_idle()
		return 0
	var/target_z = turf_of_target.z
	if(turf_of_target?.z == z)
		if(myPath.len <= 0)
			for(var/obj/structure/O in get_step(src,dir_to_target))
				if(O.density && O.climbable)
					O.climb_structure(src)
					myPath = list()
					break
			myPath = get_path_to(src, turf_of_target, /turf/proc/Distance, MAX_RANGE_FIND + 1, 250,1)

		if(myPath)
			if(myPath.len > 0)
				for(var/i = 0; i < maxStepsTick; ++i)
					if(!IsDeadOrIncap())
						if(myPath.len >= 1)
							walk_to(src,myPath[1],0,update_movespeed())
							myPath -= myPath[1]
				return 1
	else
		if(turf_of_target?.z < z)
			turf_of_target = get_step_multiz(turf_of_target, DOWN)
		else
			turf_of_target = get_step_multiz(turf_of_target, UP)
		if(turf_of_target?.z != target_z) //too far away
			back_to_idle()
			return 0
	// failed to path correctly so just try to head straight for a bit
	walk_to(src,turf_of_target,0,update_movespeed())
	sleep(1)
	walk_to(src,0)

	return 0

#undef MAX_RANGE_FIND
