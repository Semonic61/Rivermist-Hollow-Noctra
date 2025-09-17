/obj/item/organ/genitals/filling_organ/vagina
	name = "vagina"
	icon_state = "severedtail" //placeholder
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	//var/fertility = TRUE
	var/preggotimer //dumbass timer
	var/pre_pregnancy_size = 0
	reagent_to_make = /datum/reagent/consumable/femcum
	refilling = FALSE
	reagent_generate_rate = 0.5
	max_femcum = 9
	max_reagents = 40 //big cap, ordinary absorbtion.
	absorbing = TRUE
	fertility = TRUE
	spiller = TRUE
	bloatable = TRUE

	grid_width = 32 * 3 // 3 rows

/obj/item/organ/genitals/filling_organ/vagina/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	M.add_hole(ORGAN_SLOT_VAGINA, /datum/component/storage/concrete/grid/hole/vagina)

/obj/item/organ/genitals/filling_organ/vagina/Remove(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	SEND_SIGNAL(M, COMSIG_HOLE_REMOVE_HOLE, ORGAN_SLOT_VAGINA)
