/obj/item/organ/genitals/filling_organ/breasts
	name = "breasts"
	icon_state = "severedtail"
	visible_organ = TRUE
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	organ_size = DEFAULT_BREASTS_SIZE
	reagent_to_make = /datum/reagent/consumable/milk
	reagent_to_make = /datum/reagent/consumable/milk
	hungerhelp = TRUE
	absorbing = FALSE //funny liquid tanks
	startsfilled = TRUE
	//var/lactating = FALSE
	//var/milk_stored = 0
	//var/milk_max = 75

/obj/item/organ/genitals/filling_organ/breasts/New()
	..()
	if(!refilling)
		reagents.clear_reagents()
	//milk_max = max(75, organ_size * 100)

/obj/item/organ/genitals/filling_organ/breasts/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	M.add_hole(ORGAN_SLOT_BREASTS, /datum/component/storage/concrete/grid/hole/breasts)
	SEND_SIGNAL(M, COMSIG_HOLE_MODIFY_HOLE, ORGAN_SLOT_BREASTS, 3, CEILING(organ_size / 4, 1))

/obj/item/organ/genitals/filling_organ/breasts/Remove(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	SEND_SIGNAL(M, COMSIG_HOLE_REMOVE_HOLE, ORGAN_SLOT_BREASTS)
