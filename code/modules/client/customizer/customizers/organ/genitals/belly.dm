
/datum/customizer_entry/organ/genitals/belly
	var/belly_size = DEFAULT_BELLY_SIZE

/datum/customizer/organ/genitals/belly
	abstract_type = /datum/customizer/organ/genitals/belly
	name = "Belly"
	allows_disabling = TRUE
	default_disabled = FALSE

/datum/customizer/organ/genitals/belly/is_allowed(datum/preferences/prefs)
	return TRUE

/datum/customizer_choice/organ/genitals/belly
	abstract_type = /datum/customizer_choice/organ/genitals/belly
	name = "Belly"
	customizer_entry_type = /datum/customizer_entry/organ/genitals/belly
	organ_type = /obj/item/organ/genitals/belly
	organ_slot = ORGAN_SLOT_BELLY
	organ_dna_type = /datum/organ_dna/belly

/datum/customizer_choice/organ/genitals/belly/validate_entry(datum/preferences/prefs, datum/customizer_entry/entry)
	..()
	var/datum/customizer_entry/organ/genitals/belly/belly_entry = entry
	belly_entry.belly_size = sanitize_integer(belly_entry.belly_size, MIN_BELLY_SIZE, MAX_BELLY_SIZE, DEFAULT_BELLY_SIZE)

/datum/customizer_choice/organ/genitals/belly/imprint_organ_dna(datum/organ_dna/organ_dna, datum/customizer_entry/entry, datum/preferences/prefs)
	..()
	var/datum/organ_dna/belly/belly_dna = organ_dna
	var/datum/customizer_entry/organ/genitals/belly/belly_entry = entry
	belly_dna.belly_size = belly_entry.belly_size

/datum/customizer_choice/organ/genitals/belly/generate_pref_choices(list/dat, datum/preferences/prefs, datum/customizer_entry/entry, customizer_type)
	..()
	var/datum/customizer_entry/organ/genitals/belly/belly_entry = entry
	dat += "<br>Belly size: <a href='?_src_=prefs;task=change_customizer;customizer=[customizer_type];customizer_task=belly_size''>[find_key_by_value(BELLY_SIZES_BY_NAME, belly_entry.belly_size)]</a>"

/datum/customizer_choice/organ/genitals/belly/handle_topic(mob/user, list/href_list, datum/preferences/prefs, datum/customizer_entry/entry, customizer_type)
	..()
	var/datum/customizer_entry/organ/genitals/belly/belly_entry = entry
	switch(href_list["customizer_task"])
		if("belly_size")
			var/named_size = browser_input_list(user, "Choose your butt size:", "Character Preference", BELLY_SIZES_BY_NAME, belly_entry.belly_size)
			if(isnull(named_size))
				return
			var/new_size = BELLY_SIZES_BY_NAME[named_size]
			belly_entry.belly_size = sanitize_integer(new_size, MIN_BELLY_SIZE, MAX_BELLY_SIZE, DEFAULT_BELLY_SIZE)

/datum/customizer/organ/genitals/belly/human
	customizer_choices = list(/datum/customizer_choice/organ/genitals/belly/human)

/datum/customizer_choice/organ/genitals/belly/human
	sprite_accessories = list(/datum/sprite_accessory/genitals/belly)
	allows_accessory_color_customization = FALSE

/datum/customizer/organ/genitals/belly/animal
	customizer_choices = list(/datum/customizer_choice/organ/genitals/belly/animal)

/datum/customizer_choice/organ/genitals/belly/animal
	sprite_accessories = list(
		/datum/sprite_accessory/genitals/belly
		)
