/**
 * Called by SSmobs at an interval of 2 seconds.
 * Splits off into PhysicalLife() and BiologicalLife(). Override those instead of this.
 */
/mob/living
	var/SPECIAL_SET = FALSE

/mob/living/proc/Life(seconds, times_fired)
	set waitfor = FALSE
	if(!SPECIAL_SET)
		// This proc is to check if the person is abusing a UI bug, said attempt gibs them and notifies admins of the attempt.
		if ((src.special_s + src.special_p + src.special_e + src.special_c + src.special_i + src.special_a + src.special_l) > 40)
			message_admins("[src.ckey] attempted to play a character with stats greater than 40 and was gibbed as a result.")
			log_game("[key_name(src)] tried to spawn with stats greater than 40.")
			to_chat(src, "<span class='warning'>You have been gibbed for trying to use the stat exploit. Admins have been messaged and this attempt logged.</span>")
			gib(src)

		// Lifegiver/Lifeloser was put here because the on_spawn proc was not working in traits, in theory this should only
		// be called once at the same time endurance is checked. This does mean that admin spawned mobs wont run this proc, but if
		// your admin spawning a player mob you can just edit the hp at that point. -Possum
		if(HAS_TRAIT(src, TRAIT_LIFEGIVER))
			src.maxHealth += 10
			src.health += 10
		if(HAS_TRAIT(src, TRAIT_LIFELOSER))
			src.maxHealth -= 10
			src.health -= 10
		if(HAS_TRAIT(src, TRAIT_BIG_LIFELOSER))
			src.maxHealth -= 20
			src.health -= 20


		//SPECIAL integration MAIN
		// This is the primary spot for all stat based special bonuses that are passive.
		// Primarily because its easy to debug this in round. -Possum

		// STRENGTH
		if(src.special_s >= 7 && src.special_s < 9)
			ADD_TRAIT(src, TRAIT_QUICK_CARRY, "quick-carry")
		if(src.special_s >= 9)
			ADD_TRAIT(src, TRAIT_QUICKER_CARRY, "quicker-carry")

		// PERCEPTION
		if(src.special_p >= 7)
			ADD_TRAIT(src, TRAIT_NIGHT_VISION, "night_vision")

		// ENDURANCE
		src.maxHealth += (src.special_e*3)
		src.health += (src.special_e*3)

		// INTELLIGENCE
		if(src.special_i >= 3)
			ADD_TRAIT(src, TRAIT_TRIBAL, "tribal")
		if(src.special_i >= 5)
			ADD_TRAIT(src, TRAIT_GUNSMITH_ONE, "gunsmith_one")
		if(src.special_i >= 7)
			ADD_TRAIT(src, TRAIT_GUNSMITH_TWO, "gunsmith_two")
			ADD_TRAIT(src, TRAIT_EXPLOSIVE_CRAFTING, "explosive_crafting")
		if(src.special_i >= 9)
			ADD_TRAIT(src, TRAIT_PILOT, "vb_pilot")
			ADD_TRAIT(src, TRAIT_GUNSMITH_THREE, "gunsmith_three")
			ADD_TRAIT(src, TRAIT_GUNSMITH_FOUR, "gunsmith_four")

		// CHARISMA
		// Both of these spells are in terrifying_presence.dm
		if(src.special_c >= 7)
			src.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)
		if(src.special_c >= 9)
			src.AddSpell(new /obj/effect/proc_holder/spell/ferocious_loyalty)

		// AGILITY
		// The below line affects movement speed.
		update_special_speed((5-src.special_a)/20)
		if(src.special_a >= 9)
			ADD_TRAIT(src, TRAIT_NOSLIPALL, "noslip_all")
		if(src.special_a >= 6)
			ADD_TRAIT(src, TRAIT_LIGHT_STEP, "light_step")

		// Basic leap
		if(src.special_a >= 7 && src.special_a < 9)
			src.AddComponent(/datum/component/tackler/weak)
			var/datum/component/tackler/weak/T = src.LoadComponent(/datum/component/tackler/weak)
			T.stamina_cost = 30
			T.base_knockdown = 0
			T.range = 4
			T.speed = 1
			T.skill_mod = 0
			T.min_distance = 1
			ADD_TRAIT(src, TRAIT_LEAPER_WEAK, "leaper_weak")
		// Super agile and not THICC
		if(src.special_a >= 9 && src.special_s < 9)
			src.AddComponent(/datum/component/tackler/weak)
			var/datum/component/tackler/weak/T = src.LoadComponent(/datum/component/tackler/weak)
			T.stamina_cost = 20
			T.base_knockdown = 0
			T.range = 7
			T.speed = 2
			T.skill_mod = 0
			T.min_distance = 1
			ADD_TRAIT(src, TRAIT_LEAPER_MODERATE, "leaper_moderate")
		// If you have 9 strength you are THICC, can't leap as far but you hit harder and stun on impact.
		if(src.special_a >= 9 && src.special_s >= 9)
			src.AddComponent(/datum/component/tackler/strong)
			var/datum/component/tackler/strong/T = src.LoadComponent(/datum/component/tackler/strong)
			T.stamina_cost = 20
			T.base_knockdown = 0
			T.range = 5
			T.speed = 1
			T.skill_mod = 3
			T.min_distance = 1
			ADD_TRAIT(src, TRAIT_LEAPER_STRONG, "leaper_strong")

		// COMBO STATS
		// Int/End/Str - Represents a smart and strong person brute forcing PA training.
		if(src.special_i >= 9 && src.special_e >= 7 && src.special_s >= 7)
			ADD_TRAIT(src, TRAIT_PA_WEAR, "pa_wear")
		// Int/Per/Agi - Someone who is smart, perceptive, and good with their hands can cut down on crafting time.
		if(src.special_i >= 5 && src.special_e >= 5 && src.special_s >= 5)
			ADD_TRAIT(src, TRAIT_QUICK_BUILD, "quick-build")


		SPECIAL_SET = TRUE

	//SHOULD_NOT_SLEEP(TRUE)
	if(mob_transforming)
		return

	. = SEND_SIGNAL(src, COMSIG_LIVING_LIFE, seconds, times_fired)
	if(!(. & COMPONENT_INTERRUPT_LIFE_PHYSICAL))
		PhysicalLife(seconds, times_fired)
	if(!(. & COMPONENT_INTERRUPT_LIFE_BIOLOGICAL))
		BiologicalLife(seconds, times_fired)

	// CODE BELOW SHOULD ONLY BE THINGS THAT SHOULD HAPPEN NO MATTER WHAT AND CAN NOT BE SUSPENDED!
	// Otherwise, it goes into one of the two split Life procs!

	if (client)
		var/turf/T = get_turf(src)
		if(!T)
			for(var/obj/effect/landmark/error/E in GLOB.landmarks_list)
				forceMove(E.loc)
				break
			var/msg = "[key_name_admin(src)] [ADMIN_JMP(src)] was found to have no .loc with an attached client, if the cause is unknown it would be wise to ask how this was accomplished."
			message_admins(msg)
			send2irc_adminless_only("Mob", msg, R_ADMIN)
			log_game("[key_name(src)] was found to have no .loc with an attached client.")

		// This is a temporary error tracker to make sure we've caught everything
		else if (registered_z != T.z)
#ifdef TESTING
			message_admins("[src] [ADMIN_FLW(src)] has somehow ended up in Z-level [T.z] despite being registered in Z-level [registered_z]. If you could ask them how that happened and notify coderbus, it would be appreciated.")
#endif
			log_game("Z-TRACKING: [src] has somehow ended up in Z-level [T.z] despite being registered in Z-level [registered_z].")
			update_z(T.z)
	else if (registered_z)
		log_game("Z-TRACKING: [src] of type [src.type] has a Z-registration despite not having a client.")
		update_z(null)

/**
 * Handles biological life processes like chemical metabolism, breathing, etc
 * Returns TRUE or FALSE based on if we were interrupted. This is used by overridden variants to check if they should stop.
 */
/mob/living/proc/BiologicalLife(seconds, times_fired)
	SEND_SIGNAL(src,COMSIG_LIVING_BIOLOGICAL_LIFE, seconds, times_fired)
	handle_diseases()// DEAD check is in the proc itself; we want it to spread even if the mob is dead, but to handle its disease-y properties only if you're not.

	handle_wounds()

	// Everything after this shouldn't process while dead (as of the time of writing)
	if(stat == DEAD)
		return FALSE

	//Mutations and radiation
	handle_mutations_and_radiation()

	//Breathing, if applicable
	handle_breathing(times_fired)

	if (QDELETED(src)) // diseases can qdel the mob via transformations
		return FALSE

	//Random events (vomiting etc)
	handle_random_events()

	//stuff in the stomach
	handle_stomach()

	handle_block_parry(seconds)

	// These two MIGHT need to be moved to base Life() if we get any in the future that's a "physical" effect that needs to fire even while in stasis.
	handle_traits() // eye, ear, brain damages
	handle_status_effects() //all special effects, stun, knockdown, jitteryness, hallucination, sleeping, etc
	return TRUE

/**
 * Handles physical life processes like being on fire. Don't ask why this is considered "Life".
 * Returns TRUE or FALSE based on if we were interrupted. This is used by overridden variants to check if they should stop.
 */
/mob/living/proc/PhysicalLife(seconds, times_fired)
	SEND_SIGNAL(src,COMSIG_LIVING_PHYSICAL_LIFE, seconds, times_fired)
	if(digitalinvis)
		handle_diginvis() //AI becomes unable to see mob

	if((movement_type & FLYING) && !(movement_type & FLOATING))	//TODO: Better floating
		float(TRUE)

	if(!loc)
		return FALSE

	//var/datum/gas_mixture/environment = loc.return_air()

	//Handle temperature/pressure differences between body and environment
	//if(environment)
		//handle_environment(environment)

	handle_fire()

	handle_gravity()

	if(machine)
		machine.check_eye(src)
	return TRUE

/mob/living/proc/handle_breathing(times_fired)
	return

/mob/living/proc/handle_mutations_and_radiation()
	radloss = 0 //so radiation don't accumulate in simple animals
	return

/mob/living/proc/handle_diseases()
	return

/mob/living/proc/handle_wounds()
	return

/mob/living/proc/handle_diginvis()
	if(!digitaldisguise)
		src.digitaldisguise = image(loc = src)
	src.digitaldisguise.override = 1
	for(var/mob/living/silicon/ai/AI in GLOB.player_list)
		AI.client.images |= src.digitaldisguise


/mob/living/proc/handle_random_events()
	return

/mob/living/proc/handle_environment(datum/gas_mixture/environment)
	return

/mob/living/proc/handle_fire()
	if(fire_stacks < 0) //If we've doused ourselves in water to avoid fire, dry off slowly
		fire_stacks = min(0, fire_stacks + 1)//So we dry ourselves back to default, nonflammable.
	if(!on_fire)
		return 1
	if(fire_stacks > 0)
		adjust_fire_stacks(-0.1) //the fire is slowly consumed
	else
		ExtinguishMob()
		return
	//var/datum/gas_mixture/G = loc.return_air() // Check if we're standing in an oxygenless environment
	/*if(!G.get_moles(GAS_O2, 1))
		ExtinguishMob() //If there's no oxygen in the tile we're on, put out the fire
		return
	var/turf/location = get_turf(src)
	location.hotspot_expose(700, 10, 1)*/

/mob/living/proc/handle_stomach()
	return

/**
 * Check if the mob contains this reagent.
 *
 * This will validate the the reagent holder for the mob and any sub holders contain the requested reagent.
 * Vars:
 * * reagent (typepath) takes a PATH to a reagent.
 * * amount (int) checks for having a specific amount of that chemical.
 * * needs_metabolizing (bool) takes into consideration if the chemical is matabolizing when it's checked.
 */
/mob/living/proc/has_reagent(reagent, amount = -1, needs_metabolizing = FALSE)
	return reagents.has_reagent(reagent, amount, needs_metabolizing)

//this updates all special effects: knockdown, druggy, stuttering, etc..
/mob/living/proc/handle_status_effects()
	if(confused)
		confused = max(0, confused - 1)

/mob/living/proc/handle_traits()
	//Eyes
	if(eye_blind)			//blindness, heals slowly over time
		if(!stat && !(HAS_TRAIT(src, TRAIT_BLIND)))
			eye_blind = max(eye_blind-1,0)
			if(client && !eye_blind)
				clear_alert("blind")
				clear_fullscreen("blind")
		else
			eye_blind = max(eye_blind-1,1)
	else if(eye_blurry)			//blurry eyes heal slowly
		eye_blurry = max(eye_blurry-1, 0)
		if(client)
			if(!eye_blurry)
				remove_eyeblur()
			else
				update_eyeblur()

/mob/living/proc/update_damage_hud()
	return

/mob/living/proc/handle_gravity()
	var/gravity = mob_has_gravity()
	update_gravity(gravity)

	if(gravity > STANDARD_GRAVITY)
		gravity_animate()
		handle_high_gravity(gravity)

/mob/living/proc/gravity_animate()
	if(!get_filter("gravity"))
		add_filter("gravity",1, GRAVITY_MOTION_BLUR)
	INVOKE_ASYNC(src, .proc/gravity_pulse_animation)

/mob/living/proc/gravity_pulse_animation()
	animate(get_filter("gravity"), y = 1, time = 10)
	sleep(10)
	animate(get_filter("gravity"), y = 0, time = 10)

/mob/living/proc/handle_high_gravity(gravity)
	if(gravity >= GRAVITY_DAMAGE_TRESHOLD) //Aka gravity values of 3 or more
		var/grav_stregth = gravity - GRAVITY_DAMAGE_TRESHOLD
		adjustBruteLoss(min(grav_stregth,3))
