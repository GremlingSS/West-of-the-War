/datum/job/wasteland
	department_flag = WASTELAND

/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	faction = FACTION_WASTELAND
	total_positions = -1
	spawn_positions = -1
	description = "You are a denizen of the region, or have arrived here for purposes known only to you. \
	If you're new, the settlement of Westford within the central urban ruins may prove a valuable first stop. \
	Simply head along the highway until you see directional signs for the city. \
	Try to make a living for yourself - or simply survive - and craft your own unique story."
	supervisors = "fate"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13wastelander

	access = list()		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
		),
	)
	loadout_options = list(
	/datum/outfit/loadout/vault_refugee,
	/datum/outfit/loadout/salvager,
	/datum/outfit/loadout/medic,
	/datum/outfit/loadout/merchant,
	/datum/outfit/loadout/scavenger,
	/datum/outfit/loadout/settler,
	/datum/outfit/loadout/warrior,
	//datum/outfit/loadout/ncrcitizen,
	//datum/outfit/loadout/legioncivilian,
	/datum/outfit/loadout/wastelander_desert_ranger)

/datum/outfit/job/wasteland/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/wasteland/f13wastelander

	id = null
	ears = /obj/item/radio/headset
	r_hand = /obj/item/book/granter/trait/selection
	l_pocket = /obj/item/storage/bag/money/small/wastelander
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/melee/onehanded/knife/survival
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/reagent_containers/pill/radx = 1
		)

/datum/outfit/job/wasteland/f13wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/kit, \
		/obj/item/clothing/suit/f13/veteran, \
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer)


/datum/job/wasteland/f13ncrscout
	title = "NCR Scout"
	flag = F13NCRSCOUT
	faction = FACTION_WASTELAND
	total_positions = -1
	spawn_positions = -1
	description = "You are an advance scout for the NCR, sent far afield to find areas that the NCR might have interest \
	towards spreading democracy. You are a one man operation unless you encounter another NCR scout, with only your dog \
	tags proving where your loyalty lies. Best to play nice with the locals so you can collect information and report back."
	supervisors = "yourself"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13ncrscout

	access = list()		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
		),
	)

/datum/outfit/job/wasteland/f13ncrscout
	name = "NCR Scout"
	jobtype = /datum/job/wasteland/f13ncrscout

	id = /obj/item/card/id/dogtag/town/ncr
	ears = /obj/item/radio/headset/headset_ncr
	uniform = /obj/item/clothing/under/f13/ncrcaravan
	shoes = /obj/item/clothing/shoes/f13/tan
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	l_hand = /obj/item/gun/ballistic/rifle/mag/varmint
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556mm = 4,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/reagent_containers/pill/radx = 1
		)


/datum/job/wasteland/f13legion_explorer
	title = "Legion Rimor"
	flag = F13LEGIONRIMOR
	faction = FACTION_WASTELAND
	total_positions = -1
	spawn_positions = -1
	description = "You are a legion rimor, differed from a normal explorer by being given extra-autonomy as you explore far off \
	locations looking for potential tribal recruits or locations bountiful for legion annexation. Unlike most of your brothers \
	you are not as well trained nor as well equipped as a regular explorer, you must prove yourself as you make your way in this \
	unfamiliar territory. Though you carry proof of being within the legion, experience has taught you to hide yourself."
	supervisors = "yourself"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13legion_explorer

	access = list()		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
		),
	)

/datum/outfit/job/wasteland/f13legion_explorer
	name = "Legion Rimor"
	jobtype = /datum/job/wasteland/f13legion_explorer

	id = /obj/item/card/id/dogtag/town/legion
	ears = /obj/item/radio/headset/headset_legion
	uniform = /obj/item/clothing/under/f13/doctor
	shoes = /obj/item/clothing/shoes/f13/fancy
	suit = /obj/item/clothing/suit/curator
	head = /obj/item/clothing/head/scarecrow_hat
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/welding
	l_hand = /obj/item/shield/riot/buckler
	backpack_contents = list(
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/reagent_containers/pill/patch/hydra = 1
		)


/datum/job/wasteland/f13brotherhood_initiate
	title = "Brotherhood Scout-Knight"
	flag = F13BOSSKNIGHT
	faction = FACTION_WASTELAND
	total_positions = -1
	spawn_positions = -1
	description = "As a scout-knight you are a member of the brotherhoods advanced recon, sparsely equipped and expected to \
	survive and thrive in the wasteland. Your job is to detail advanced technologies, groups, and pre-war locations for \
	other better equipped members in the brotherhood to sieze and bring back to the bunkers. Remember, you are so far out \
	that you are practically alone, be prepared."
	supervisors = "yourself"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13brotherhood_initiate

	access = list()		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
		),
	)

/datum/outfit/job/wasteland/f13brotherhood_initiate
	name = "Brotherhood Scout-Knight"
	jobtype = /datum/job/wasteland/f13brotherhood_initiate

	id = /obj/item/card/id/dogtag/town/legion
	ears = /obj/item/radio/headset/headset_bos
	backpack = /obj/item/storage/backpack/explorer
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/initiate
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz = 1,
		/obj/item/stock_parts/cell/ammo/ec = 3,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/reagent_containers/pill/radx = 1
		)


/datum/job/wasteland/f13khan_runner
	title = "Great Khan Runner"
	flag = F13KHANRUNNER
	faction = FACTION_WASTELAND
	total_positions = -1
	spawn_positions = -1
	description = "You run chems for the great khans, either your tribe hates you or you're the best at surviving alone and \
	unsupported. In either case, you have found yourself far out in this area looking to make and peddle chems so you can send \
	caps back to your tribesman. Without your gang, you are at a huge disadvantage and your tribal tattoos are impossible to \
	hide. Better make friends with the locals, maybe even the raiders."
	supervisors = "yourself"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13khan_runner

	access = list()		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
		),
	)

/datum/outfit/job/wasteland/f13khan_runner
	name = "Great Khan Runner"
	jobtype = /datum/job/wasteland/f13khan_runner

	id = /obj/item/card/id/khantattoo
	ears = /obj/item/radio/headset/headset_khans
	shoes = /obj/item/clothing/shoes/f13/military/khan
	backpack =	/obj/item/storage/backpack/satchel/explorer
	satchel = 	/obj/item/storage/backpack/satchel/old
	uniform = /obj/item/clothing/under/f13/khan
	gloves = /obj/item/melee/unarmed/brass/spiked
	box = /obj/item/storage/survivalkit/khan
	backpack_contents = list(
		/obj/item/twohanded/baseball/spiked = 1,
		/obj/item/storage/bag/money/small/khan = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/reagent_containers/pill/radx = 1
		)


///////////////////////////////// Loadouts ///////////////////////////////////////////////////
/datum/outfit/loadout/salvager
	name = "Salvager"
	uniform = /obj/item/clothing/under/f13/machinist
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	neck = /obj/item/clothing/neck/apron/labor/forge/khan
	belt = /obj/item/storage/belt/utility/artisan/full
	glasses = /obj/item/clothing/glasses/welding
	backpack_contents = list(/obj/item/gun/ballistic/automatic/pistol/m1911=1, /obj/item/ammo_box/magazine/m45 = 2, /obj/item/twohanded/sledgehammer/simple = 1, /obj/item/book/manual/advice_blacksmith = 1)

/datum/outfit/loadout/scavenger
	name = "Scavenger"
	shoes = /obj/item/clothing/shoes/f13/explorer
	r_hand = /obj/item/storage/backpack/duffelbag/scavengers
	l_hand = /obj/item/pickaxe/drill
	belt = /obj/item/storage/belt
	backpack_contents = list(/obj/item/mining_scanner=1,
							/obj/item/metaldetector=1,
							/obj/item/shovel=1,
							/obj/item/gun/ballistic/automatic/pistol/m1911=1,
							/obj/item/ammo_box/magazine/m45 = 2)

/datum/outfit/loadout/settler
	name = "Settler"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/explorer
	r_hand = /obj/item/hatchet
	l_hand = /obj/item/gun/ballistic/automatic/pistol/n99
	belt = /obj/item/storage/belt
	backpack_contents = list(
		/obj/item/stack/sheet/metal/fifty = 1,
		/obj/item/stack/sheet/mineral/wood/fifty = 1,
		/obj/item/pickaxe/mini = 1,
		/obj/item/toy/crayon/spraycan = 1,
		/obj/item/cultivator = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/storage/bag/plants/portaseeder = 1,
		/obj/item/ammo_box/magazine/m10mm = 2
		)

/datum/outfit/loadout/medic
	name = "Wasteland Doctor"
	uniform = /obj/item/clothing/under/f13/follower
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/followers
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/color/latex
	neck = /obj/item/clothing/neck/stethoscope
	belt = /obj/item/storage/belt/medical
	backpack_contents =  list(/obj/item/reagent_containers/medspray/synthflesh=2,
							/obj/item/smelling_salts=1,
							/obj/item/healthanalyzer=1,
							/obj/item/gun/ballistic/automatic/pistol/m1911=1,
							/obj/item/ammo_box/magazine/m45 = 2,
							/obj/item/reagent_containers/glass/bottle/epinephrine=2,
							/obj/item/storage/backpack/duffelbag/med/surgery=1,
							/obj/item/paper_bin=1,
							/obj/item/folder=1,
							/obj/item/pen/fountain=1,
							/obj/item/storage/firstaid/ancient=1,
		)

/datum/outfit/loadout/merchant
	name = "Roving Trader"
	uniform = /obj/item/clothing/under/f13/merchant
	neck = /obj/item/clothing/neck/mantle/brown
	shoes = /obj/item/clothing/shoes/f13/brownie
	head = /obj/item/clothing/head/f13/stormchaser
	gloves = /obj/item/clothing/gloves/color/brown
	glasses = /obj/item/clothing/glasses/f13/biker
	l_hand = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents =  list(/obj/item/storage/box/vendingmachine=1,
							/obj/item/gun/ballistic/automatic/pistol/m1911=1, /obj/item/ammo_box/magazine/m45 = 2, /obj/item/ammo_box/shotgun/buck = 2)

/datum/outfit/loadout/vault_refugee
	name = "Vaultie"
	uniform = /obj/item/clothing/under/f13/vault
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/card/id/dogtag/vaultiecard
	suit = /obj/item/clothing/suit/suspenders
	ears = /obj/item/radio/headset
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/n99=1,
		/obj/item/ammo_box/magazine/m10mm=4,
		/obj/item/pda=1,)

/datum/outfit/loadout/warrior
	name = "Wasteland Warrior"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/raidertreads
	suit = /obj/item/clothing/suit/armor/light/wastewar
	head = /obj/item/clothing/head/helmet/f13/wastewarhat
	glasses = /obj/item/clothing/glasses/welding
	l_hand = /obj/item/shield/riot/buckler/stop
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/scrapsabre = 1,
		)

/datum/outfit/loadout/legioncivilian
	name = "Legion Civilian"
	uniform = /obj/item/clothing/under/f13/doctor
	shoes = /obj/item/clothing/shoes/f13/fancy
	suit = /obj/item/clothing/suit/curator
	head = /obj/item/clothing/head/scarecrow_hat
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/welding
	id = /obj/item/card/id/dogtag/town/legion
	l_hand = /obj/item/shield/riot/buckler
	backpack_contents = list(
		/obj/item/melee/onehanded/machete = 1,
		)

/datum/outfit/loadout/ncrcitizen
	name = "NCR Citizen"
	uniform = /obj/item/clothing/under/f13/ncrcaravan
	shoes = /obj/item/clothing/shoes/f13/tan
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	id = /obj/item/card/id/dogtag/town/ncr
	l_hand = /obj/item/gun/ballistic/rifle/mag/varmint
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556mm=4)

/datum/outfit/loadout/wastelander_desert_ranger
	name = "Desert Cowboy"
	uniform = /obj/item/clothing/under/f13/desert_ranger_scout
	shoes = /obj/item/clothing/shoes/f13/cowboy
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	l_hand = /obj/item/gun/ballistic/revolver/colt357
	backpack_contents = list(
		/obj/item/ammo_box/a357=2,
		/obj/item/binoculars=1,
		/obj/item/radio=1,
		/obj/item/melee/onehanded/knife/hunting=1)
