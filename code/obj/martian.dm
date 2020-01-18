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

	proc/eat_hand(var/mob/user as mob)
		user.show_text("You fail to break free!", "red")
		boutput(user, "<span style=\"color:red\"><B>CRONCH</B></span>")
		if (user.hand && user.limbs)
			user.drop_item()
			if (user.hand == 0 && user.limbs.r_arm) // Right hand
				var/obj/item/parts/r_arm = user.limbs.r_arm
				r_arm.sever()
				qdel(r_arm)
			else if (user.hand == 1 && user.limbs.l_arm) // Left hand
				var/obj/item/parts/l_arm = user.limbs.l_arm
				l_arm.sever()
				qdel(l_arm)
		user.TakeDamage("All", rand(20, 30), 0, 0, DAMAGE_STAB, 1) //Limb loss disallowed here to make sure that the immediately following limb loss works properly!
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



