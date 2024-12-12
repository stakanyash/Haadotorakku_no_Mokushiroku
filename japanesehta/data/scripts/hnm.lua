version = "1.0.3"
build = "241212c"
releaseType = "dev"

LOG("Haadotorakku no Mokushiroku v" .. version .. " [" .. build .. "] (" .. releaseType .. ")")

function CountPlayerProgress()
	local progress = 0
	-- secondary quests
	local quests = {
		"d_PunishBandits_Quest", 
		"WorkGiver_Quest1",
		"ReturnToDirector2_Quest", 
		"Signs_Quest", 
		"r1m3_BonnyAndKlideQuest", 
		"r1m3_ArchHelp", 
		"r1m3_OldTownOutsiderCar_Quest", 
		"TraiderStorage_Quest1", 
		"q_FindHusbent", 
		"r2m1_ArtViva_Quest", 
		"r2m1_KillGodFather_Quest", 
		"r2m2_Znaki2Midgard_Quest", 
		"r2m2_HeadsHunterQuest", 
		"r2m2_OldDvigatel2_Quest", 
		"r3m1_RescueUlukCivil", 
		"q_VisitDruid", 
		"q_PlaceWithSign", 
		"r1m1_Botanik_Quest", 
		"HelpRuins_Quest", 
		"DestroyRuins_Quest"
	}

	for quest = 1, getn(quests) do
		if QuestStatus(quests[quest])==Q_COMPLETED then
			progress = progress + 1
		else
			LOG("Quest "..quests[quest].." is not completed.")
			println("Quest "..quests[quest].." is not completed.")
		end
	end
	
	-- collected books
	local books = {
		"r3_book_transformer", 
		"r3_book_Druids", 
		"r4_book_Scarytail1", 
		"r1_book_desert_death", 
		"r1_book_cold_winter", 
		"r1_book_the_mask", 
		"r1_book_travel_kupchina1", 
		"r1_book_travel_kupchina2", 
		"r1_book_kollizey_flyer1", 
		"r1_book_kollizey_flyer2", 
		"r1_book_sng_flyer", 
		"r1_book_true_ar", 
		"r1_book_ar_flyer", 
		"r1_book_doklad"
	}

	for book = 1, getn(books) do
		if BookExists(books[book]) then 
			progress = progress + 1
		else
			LOG("Book "..books[book].." is not collected.")
			println("Book "..books[book].." is not collected.")
		end
	end
	local percentage = string.format( "%.0f", progress/33*100)
	println(percentage.."%")

	return tonumber(percentage)
end