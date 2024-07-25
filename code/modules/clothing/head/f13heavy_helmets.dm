//////////////////////////
// Salvaged Power Armor //
//////////////////////////

/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa
	name = "salvaged power helmet"
	desc = "It's a salvaged power armor helmet of what..? YOU CAN'T SEE ME! STOP! REPORT TO CODERS!!"
	slowdown = 0.1
	flags_cover = HEADCOVERSEYES|HEADCOVERSMOUTH
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR|HIDESNOUT
	var/repair_path = /obj/item/clothing/head/helmet/f13/power_armor/t45d
	var/salvage_step = 0

/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/examine(mob/user)
	. = ..()
	if(ispath(repair_path))
		. += repair_hint()

/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/proc/repair_hint()
	switch(salvage_step)
		if(0)
			return "<span class='notice'>The wiring cover is <i>screwed</i> shut.</span>"
		if(1)
			return "<span class='notice'>The cover is <i>screwed</i> open and <i>wires</i> are awaiting repairs.</span>"
		if(2)
			return "<span class='warning'>The wiring has been <i>repaired</i> and components exposed by <i>bolts</i> need fixing.</span>"
		if(3)
			return "<span class='warning'>The components have been <i>repaired</i> and servomotors inside the suit need to be <i>welded to the frame</i>.</span>"


/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/attackby(obj/item/I, mob/living/carbon/human/user, params)
	if(ispath(repair_path) && user.special_i >= 9 && (HAS_TRAIT(user,TRAIT_TECHNOPHREAK) || HAS_TRAIT(user,TRAIT_RESEARCHER)))
		switch(salvage_step)
			if(0)
				// Fix
				if(istype(I, /obj/item/screwdriver))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You open the secure paneling to expose the remants of the wiring.</span>")
					if(I.use_tool(src, user, 60, volume=50))
						salvage_step = 1
						to_chat(user, "<span class='notice'>You open the wiring cover.</span>")
					return
			if(1)
				// Fix
				if(istype(I, /obj/item/wirecutters))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin removing burnt or snipped wiring and reconnecting each cable...</span>")
					if(I.use_tool(src, user, 80, volume=50))
						salvage_step = 2
						to_chat(user, "<span class='notice'>You remove, repair, and reconnect the wires as needed.</span>")
					return
			if(2)
				// Fix
				if(istype(I, /obj/item/wrench))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You start resecuring and field repairing the components.</span>")
					if(I.use_tool(src, user, 100, volume=50))
						salvage_step = 3
						to_chat(user, "<span class='notice'>You secure and repair the inner components.</span>")
					return
			if(3)
				// Fix
				if(istype(I, /obj/item/weldingtool) || istype(I, /obj/item/gun/energy/plasmacutter))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the suit before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin welding the newly repaired servomotors to the frame.</span>")
					if(I.use_tool(src, user, 150, volume=60))
						to_chat(user, "<span class='notice'>You re-connect servomotors to the main frame.</span>")
						var/obj/item/ST = new repair_path(src)
						user.put_in_hands(ST)
						qdel(src)
					return
	else if(user.special_i < 9 || (!HAS_TRAIT(user,TRAIT_TECHNOPHREAK) || !HAS_TRAIT(user,TRAIT_RESEARCHER)))
		to_chat(user, "<span class='notice'>You have no idea how to repair this.</span>")
	return ..()

// T-45D
/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t45d
	name = "salvaged T-45d helmet"
	desc = "It's a salvaged T-45d power armor helmet."
	icon_state = "t45dhelmet0"
	item_state = "t45dhelmet0"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 45, "energy" = 20, "bomb" = 35, "bio" = 30, "rad" = 20, "fire" = 35, "acid" = 0, "wound" = 40)

/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t45d/raider
	name = "raider salvaged power helmet"
	desc = "A heavily modified, almost bastardised T-45d power armor helmet."
	icon_state = "raiderpa_helm"
	item_state = "raiderpa_helm"

/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t45d/hotrod
	name = "hotrod salvaged power helmet"
	desc = "This power armor helmet is so decrepit and battle-worn that it have lost most of its capability to protect the wearer from harm."
	icon_state = "t45hotrod_helm"
	item_state = "t45hotrod_helm"

/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t45d/tribal
	name = "tribal salvaged headdress"
	desc = "A salvaged T-45d powered armor, with the servos removed and a feathered headdress. Certain bits of plating have been stripped out to retain more freedom of movement."
	icon_state = "tribal_PA_helmet"
	item_state = "tribal_PA_helmet"
	armor = list("melee" = 60, "bullet" = 55, "laser" = 45, "energy" = 20, "bomb" = 30, "bio" = 30, "rad" = 20, "fire" = 30, "acid" = 0, "wound" = 35)
	slowdown = 0.05		//0.35 with helmet

// Midwest
/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/midwest
	name = "salvaged midwestern T-51b power helmet"
	desc = "This helmet belongs to the Midwestern branch of the Brotherhood of Steel. Its electronics appear to have been stripped out."
	icon_state = "midwestgrey_helm"
	item_state = "midwestgrey_helm"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 60, "energy" = 20, "bomb" = 45, "bio" = 70, "rad" = 50, "fire" = 75, "acid" = 35, "wound" = 40)
	slowdown = 0.05
	repair_path = /obj/item/clothing/head/helmet/f13/power_armor/t51b

// Hardened Midwest
/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/midwest/hardened
	name = "salvaged hardened midwestern T-51b power helmet"
	desc = "This helmet belongs to the Midwestern branch of the Brotherhood of Steel. Its electronics appears to have been stripped out."
	icon_state = "midwestpa_helm"
	item_state = "midwestpa_helm"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 65, "energy" = 20, "bomb" = 50, "bio" = 80, "rad" = 60, "fire" = 80, "acid" = 35, "wound" = 50)
	slowdown = 0.05
	repair_path = /obj/item/clothing/head/helmet/f13/power_armor/t51b

// T-51B
/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t51b
	name = "salvaged T-51b power armor"
	desc = "It's a salvaged T-51b power armor helmet."
	icon_state = "t51bhelmet0"
	item_state = "t51bhelmet0"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 65, "energy" = 40, "bomb" = 65, "bio" = 100, "rad" = 99, "fire" = 90, "acid" = 40, "wound" = 50)
	slowdown = 0.05
	repair_path = /obj/item/clothing/head/helmet/f13/power_armor/t51b

// T-60A
/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t60
	name = "salvaged T-60a helmet"
	desc = "It's a salvaged T-60a power armor helmet."
	icon_state = "t60helmet0"
	item_state = "t60helmet0"
	armor = list("melee" = 80, "bullet" = 70, "laser" = 40, "energy" = 31, "bomb" = 55, "bio" = 70, "rad" = 60, "fire" = 80, "acid" = 35, "wound" = 45)
	slowdown = 0.05
	repair_path = /obj/item/clothing/head/helmet/f13/power_armor/t60

// X-02
/obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/x02
	name = "\improper salvaged APA Mk II helmet"
	desc = "It's a salvaged X-02 power armor helmet."
	icon_state = "advanced"
	item_state = "advanced"
	armor = list("melee" = 75, "bullet" = 75, "laser" = 85, "energy" = 85, "bomb" = 70, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 50, "wound" = 50)
	slowdown = 0.1
	repair_path = /obj/item/clothing/head/helmet/f13/power_armor/x02helmet
