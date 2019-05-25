/*
//////////////////////////////////////

Dabbing

	Very Noticable.
	Increases resistance.
	Doesn't increase stage speed.
	Low Level.


//////////////////////////////////////
*/

/datum/symptom/dab
	name = "Dabbing"
	desc = "The virus targets the brain of the host, making them compulsively dab."
	stealth = -3
	resistance = 1
	stage_speed = 0
	transmittable = 0
	level = 4
	severity = 3
	symptom_delay_min = 10
	symptom_delay_max = 60
	threshold_desc = "<b>Stage Speed 8:</b> Increases dabbing frequency."

/datum/symptom/dab/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.properties["stage_rate"] >= 8) //increases symptom trigger rate
		symptom_delay_min = 5
		symptom_delay_max = 45

/datum/symptom/dab/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/M = A.affected_mob
	switch(A.stage)
		if(1, 2, 3)
			to_chat(M, "<span notice='warning'>[pick("You feel like dabbing.")]</span>")
		else
			M.emote("dab")

