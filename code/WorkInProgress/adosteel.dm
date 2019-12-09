/obj/item/disk/data/fixed_disk/adosteel

	New()
		..()
		//wait a minute this actually isn't that bad now that I'm looking at it
		//welp, first let's make some directories to throw the logs in!

		var/datum/computer/folder/newfolder = new datum/computer/folder()
		newfolder.name = "logs"
		src.root.add_file(newfolder)
		newfolder.add_file(new /datum/computer/file/record/c3help(src))

		newfolder = new datum/computer/folder
		newfolder.name = "bin"
		src.root.add_file(newfolder)
		newfolder.add_file(new datum/computer/file/terminal_program/write_wizard(src))

		newfolder = new datum/computer/folder
		newfolder.name = "docs"
		src.root.add_file(newfolder)
		newfolder.add_file(new datum/computer/file/record/adosteel_md_log_01(src))
		newfolder.add_file(new datum/computer/file/record/adosteel_md_log_06(src))
		newfolder.add_file(new datum/computer/file/record/adosteel_md_log_18(src))


/datum/computer/file/record/adosteel_md_log_01

	name = "log01"
	fields = list(
	"|--------------| Log 01 |--------------|",
	"It's certainly been an eventful week.",
	"I've been assigned the task of ",
	"coordinating the medical staff at a new",
	"planetbound research facility. ",
	"Thankfully my coworkers so far have shown",
	"the same respect to me that I have toward",
	"them."
	"",
	"The swamps here on Adosteel are about",
	"as healthy to live in as they appear.",
	"Employees assigned to this location are",
	"required to take several immunizers",
	"before they are even allowed to step",
	"through the portal to get here! It's",
	"madness. What on Earth have they found",
	"here that is so critical to research",
	"that they would willingly put human",
	"beings here? It's above my paycheck to",
	"ask unfortunately..."
	"|--------------------------------------|")
	)

/datum/computer/file/record/adosteel_md_log_06

	name = "log06"
	fields = list(
	"|--------------| Log 06 |--------------|",
	"We are now in our 6th week of operation.",
	"Now that I've managed to work out a",
	"schedule and rhetoric for our medical",
	"team, it's become considerably less",
	"hectic to perform my duties. The crew",
	"have not always been cooperartive with",
	"sticking to their prescriptions and some",
	"...well, some of them just don't care",
	"about their own health. It seems the pay",
	"bonus is all some of them are here for.",
	"",
	"At lunch yesterday I overheard some",
	"excited chatter from a pair of",
	"researchers. It was difficult to catch",
	"everything, but I heard something about",
	"the subject of biological engineering.",
	"They caught me overhearing and shot",
	"me dirty looks until I left the room.",
	"Cheeky bastards.",
	"",
	"Why all this secrecy? It's getting",
	"incredibly irritating..."
	"|--------------------------------------|")
	)

datum/computer/file/record/adosteel_md_log_18

	name - "log18"
	fields = list(
	"|--------------| Log 18 |--------------|",
	"Oh god damn it. I've made a mistake.",
	"Really shouldn't have asked anything.",
	"Got put under intense scrutiny from RD",
	"And now he's monitoring everything I do.",
	"Now he's even spying on my log entries.",
	"I bet he thinks he's so clever.",
	"Cunt.",
	"",
	"So, even though I know what's happenng",
	"Under no circumstances can I type info",
	"Into this terminal.",
	"Tough luck, to anyone who finds these.",
	"|--------------------------------------|")
	)