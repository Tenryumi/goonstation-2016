/obj/decal/aliencomputer
	name ="Strange Computer"
	desc ="This appears to be some sort of martian computer. The display is in an incomprehensible language."
	icon = 'icons/turf/martian.dmi'
	icon_state = "display_scroll"
	anchored = 1

/obj/crevice
	name ="Mysterious Crevice"
	desc = "Perhaps you shouldn't stick your hand in."
	icon = 'icons/turf/martian.dmi'
	icon_state = "crevice0"
	anchored = 1
	var/used = 0
	var/id = null

	proc/close_self()
		icon_state = "crevice1"
		desc = "The crevice has closed"
		used = 1

	proc/eat_arm(var/mob/user as mob, arm_to_cronch)
		boutput(user, "<span style=\"color:red\"><B>You fail to break free!</B></span>")
		boutput(user, "<span style=\"color:red\"><B>CRONCH</B></span>")
		user.TakeDamage("All", rand(20, 30), 0, 0, DAMAGE_STAB, 1) //Limb loss disallowed here to make sure that the immediately following limb loss works properly!
		if (istype(user, /mob/living/carbon/human))
			switch(arm_to_cronch)
				if("l_arm")
					qdel(user.limbs.l_arm)
				if("r_arm")
					qdel(user.limbs.r_arm)
		user.updatehealth()
		sleep(30)
		playsound(src.loc, "sound/misc/burp_alien.ogg", 50, 1)
		var/obj/decal/cleanable/blood/gibs/gib =new /obj/decal/cleanable/blood/gibs/core( src.loc )
		gib.streak(src.dir)
		close_self()

/obj/crevice/attack_hand(var/mob/user as mob)
	if(..())
		return
	if(used)
		return
	playsound(src.loc, "sound/effects/fleshbr1.ogg", 50, 1)
	boutput(user, "<span style=\"color:red\">You reach your hand into the crevice.</span>")

	if(id)
		for(var/obj/machinery/door/unpowered/martian/D)
			D.locked = !D.locked
		boutput(user, "<span style=\"color:blue\">You push down on something.</span>")
		return
	else if(prob(10))
		boutput(user, "<span style=\"color:red\"><B>Something has clamped down on your hand!</B></span>")
		user.stunned += 10
		spawn(30)
			if(prob(25))
				eat_hand(user)
				return
			else
				boutput(user, "<span style=\"color:red\">You manage to pull out your hand!</span>")
				user.stunned -= 10
				if(user.stunned<0)
					user.stunned = 0
				user.TakeDamage("All", 10, 0, DAMAGE_STAB)
				user.updatehealth()
				var/obj/decal/cleanable/blood/gibs/gib =new /obj/decal/cleanable/blood/gibs( src.loc )
				gib.streak(user.dir)

	else if(prob(45))
		boutput(user, "<span style=\"color:red\">You pull something out!</span>")
		var/itemtype = pick(/obj/item/gun/energy/laser_gun,/obj/critter/cat,/obj/item/skull)
		new itemtype(src.loc)
		var/obj/decal/cleanable/blood/gibs/gib =new /obj/decal/cleanable/blood/gibs( src.loc )
		gib.streak(user.dir)
	else
		boutput(user, "<span style=\"color:red\">There doesn't appear to be anything inside</span>")
		var/obj/decal/cleanable/blood/gibs/gib =new /obj/decal/cleanable/blood/gibs( src.loc )
		gib.streak(user.dir)
	close_self()



