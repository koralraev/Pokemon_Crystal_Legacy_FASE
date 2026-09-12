	object_const_def
	const DARKCAVEBLACKTHORNENTRANCE_PHARMACIST
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL1
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL2
	const DARKCAVEBLACKTHORNENTRANCE_STONRECURATOR

DarkCaveBlackthornEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

DarkCaveBlackthornEntrancePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
	iftrue .GotBlackglasses
	writetext DarkCaveBlackthornEntrancePharmacistText1
	promptbutton
	verbosegiveitem BLACKGLASSES
	iffalse .PackFull
	setevent EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
.GotBlackglasses:
	writetext DarkCaveBlackthornEntrancePharmacistText2
	waitbutton
.PackFull:
	closetext
	end

DarkCaveBlackthornEntranceRevive:
	itemball REVIVE

DarkCaveBlackthornEntranceTMSnore:
	itemball TM_SNORE
	
DarkCaveBlackthornEntranceStoneCuratorScript:
	opentext
	checkevent EVENT_GREETED_STONECURATOR
	iftrue .StoneShop
	writetext StoneCuratorDotText
	promptbutton
	closetext
	pause 30
	faceplayer
	opentext
	writetext StoneCuratorGreetingText
	waitbutton
.StoneShop
	faceplayer
	writetext StoneCuratorShopText
	yesorno
	iffalse .Cancel
	special PlaceMoneyTopRight

.Page1:
	loadmenu .SCShopPage1
	verticalmenu
	closewindow
	ifequal 1, .HeatRock
	ifequal 2, .DampRock
	ifequal 3, .SmoothRock
	ifequal 4, .IcyRock
	ifequal 5, .LightClay
	ifequal 6, .Page2
	sjump .Cancel
.Page2:
	loadmenu .SCShopPage2
	verticalmenu
	closewindow
	ifequal 1, .KingsRock
	ifequal 2, .HardStone
	ifequal 3, .BrickPiece
	ifequal 4, .EvoStones
	ifequal 5, .Goggles
	ifequal 6, .Cancel
	sjump .Cancel

.SCShopPage1:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 15, TEXTBOX_Y
	dw .SCMenuDataPage1
	db 1
.SCMenuDataPage1:
	db STATICMENU_CURSOR ; flags
	db 6 ; max 6 items + cancel options
	db "HEAT ROCK@"
	db "DAMP ROCK@"
	db "SMOOTH ROCK@"
	db "ICY ROCK@"
	db "LIGHT CLAY@"
	db "NEXT@"
.SCShopPage2:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 15, TEXTBOX_Y
	dw .SCMenuDataPage2
	db 1
.SCMenuDataPage2:
	db STATICMENU_CURSOR ; flags
	db 6 ; max 6 items + cancel options
	db "KING'S ROCK@"
	db "HARD STONE@"
	db "BRICK PIECE@"
	db "EVO STONES?@"
	db "GOGGLES@"
	db "CANCEL@"
	
.HeatRock:
	writetext SCHeatRockText
	waitbutton
	writetext SCDoYouWantItText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 9000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 9000
	special PlaceMoneyTopRight
	verbosegiveitem HEAT_ROCK
	sjump .BroughtItem
.DampRock:
	writetext SCDampRockText
	waitbutton
	writetext SCDoYouWantItText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 9000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 9000
	special PlaceMoneyTopRight
	verbosegiveitem DAMP_ROCK
	sjump .BroughtItem
.SmoothRock:
	writetext SCSmoothRockText
	waitbutton
	writetext SCDoYouWantItText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 9000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 9000
	special PlaceMoneyTopRight
	verbosegiveitem SMOOTH_ROCK
	sjump .BroughtItem
.IcyRock:
	writetext SCIcyRockText
	waitbutton
	writetext SCDoYouWantItText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 9000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 9000
	special PlaceMoneyTopRight
	verbosegiveitem ICY_ROCK
	sjump .BroughtItem
.LightClay:
	writetext SCLightClayText
	waitbutton
	writetext SCDoYouWantItText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 9000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 9000
	special PlaceMoneyTopRight
	verbosegiveitem LIGHT_CLAY
	sjump .BroughtItem
.KingsRock:
	writetext SCKingsRockText
	waitbutton
	writetext SCDoYouWantItText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 9000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 9000
	special PlaceMoneyTopRight
	verbosegiveitem KINGS_ROCK
	sjump .BroughtItem
.HardStone:
	writetext SCHardStoneText
	waitbutton
	writetext SCDoYouWantItText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 1000
	special PlaceMoneyTopRight
	verbosegiveitem HARD_STONE
	sjump .BroughtItem
.BrickPiece:
	writetext SCBrickPieceText
	waitbutton
	writetext SCDoYouWantItText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 9000
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 9000
	special PlaceMoneyTopRight
	verbosegiveitem BRICK_PIECE
	sjump .BroughtItem
.EvoStones:
	writetext SCEvoStonesText
	waitbutton
	sjump .Refused
.Goggles:
	writetext SCGogglesText
	waitbutton
	writetext SCDoYouWantItText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 9900
	ifequal HAVE_LESS, .NotEnoughMoney
	takemoney YOUR_MONEY, 9900
	special PlaceMoneyTopRight
	verbosegiveitem GOGGLES
	sjump .BroughtItem

.BroughtItem:
	writetext SCPleaseComeAgainText
	setevent EVENT_GREETED_STONECURATOR
	waitbutton
	closetext
	turnobject DARKCAVEBLACKTHORNENTRANCE_STONRECURATOR, DOWN
	end
	
.NotEnoughMoney:
	writetext SCNotEnoughMoneyText
	waitbutton
	closetext
	turnobject DARKCAVEBLACKTHORNENTRANCE_STONRECURATOR, DOWN
	end
.Refused:
	writetext SCAnythingElseText
	yesorno
	iftrue .Page1
	sjump .Cancel
.Cancel:
	writetext SCCancelText
	waitbutton
	closetext
	turnobject DARKCAVEBLACKTHORNENTRANCE_STONRECURATOR, DOWN
	end

	
StoneCuratorDotText:
	text "..."
	done
StoneCuratorGreetingText:
	text "You might wonder"
	line "what exactly I am"
	cont "doing here in a"
	cont "damp, dark cave?"
	
	para "I research rare"
	line "rocks and stones."
	para "I'm a Stone Curator"
	line "of sorts."
	
	para "Incidentally, I"
	line "also sell some of"
	cont "the stones I find."
	para "Interested?"
	done
StoneCuratorShopText:
	text "Want to see my"
	line "fine selection?"
	done
	
SCHeatRockText:
	text "Yes. This peculiar" ;max col 34
	line "rock is very odd."
	para "Even if kept away"
	line "from a heat source"
	cont "for any extended"
	cont "period it keeps on"
	cont "being warm."
	cont "Even I do not know"
	cont "why or how."
	para "Also, it extends"
	line "the duration of"
	cont "SUNNY DAY."
	para "It will cost you"
	line "9000¥."
	done
SCDampRockText:
	text "Some rocks can"
	line "absorb moisture."
	cont "And this rock is"
	cont "exceptionally"
	cont "absorbant."
	para "It will extend"
	line "the duration of"
	cont "RAIN DANCE."
	para "And it costs"
	line "9000¥."
	done
SCSmoothRockText:
	text "If you disregard"
	line "the cystalline"
	cont "structures of this"
	cont "rock, the core has"
	cont "and extremely"
	cont "smooth surface."
	para "Years of exposure"
	line "to rough weather"
	cont "has smoothed it."
	para "It extends the"
	line "duration of"
	cont "SANDSTORM."
	para "I can sell it to"
	line "you for 9000¥."
	done
SCIcyRockText:
	text "This rock has lain"
	line "in glacial ice for"
	cont "centuries, maybe"
	cont "even millennia."
	para "Cold has crept so"
	line "intensely into it"
	cont "that it almost"
	cont "burns to touch!"
	para "It will also"
	line "extend the dura-"
	cont "tion of HAIL."
	para "9000¥ and it's"
	line "yours."
	done
SCLightClayText:
	text "This clay is truly"
	line "enigmatic."
	para "It is very light"
	line "in weight compared"
	cont "normal types of"
	cont "clay, and it emits"
	cont "a faint glow."
	para "I have choosen to"
	line "name it"
	cont "'LIGHT CLAY'"
	cont "because it"
	cont "describes both"
	cont "these properties."
	para "I will sell it to"
	line "you for 9000¥."
	done
SCKingsRockText:
	text "This is very"
	line "interesting."
	para "This rock forms"
	line "in a crown-like"
	cont "shape. It only"
	cont "forms in deep"
	cont "and damp places,"
	cont "usually populated"
	cont "by SLOWPOKEs."
	para "No one is sure if"
	line "there is a"
	cont "correlation there."
	para "You can buy it for"
	line "9000¥ and then you"
	cont "won't have to go"
	cont "to another deep"
	cont "and damp cave."
	done
SCHardStoneText:
	text "Generally not"
	line "valued very high"
	cont "but nonetheless"
	cont "an interesting"
	cont "stone because of"
	cont "it's immense"
	cont "hardness."
	para "I'll sell it to" 
	line "you cheap. 1000¥."
	done
SCBrickPieceText:
	text "For the uneducated"
	line "this might look"
	cont "like an ordinary"
	cont "brick, but in"
	cont "reality it is a"
	cont "very rare chunk"
	cont "of tile."
	para "I'm not happy"
	line "to part with it"
	cont "but I am willing"
	cont "to sell it to you"
	cont "for 9000¥."
	done
SCEvoStonesText:
	text "Evolution stones?"
	para "No. As I said I"
	line "only deal in"
	cont "rare stones."
	done 
SCGogglesText:
	text "These? They are"
	line "field equipment."
	para "I use them when"
	line "searching in rough"
	cont "environments."
	para "I guess they could"
	line "be used as"
	cont "protective gear"
	cont "in #MON battle."
	para "They are quite"
	line "expensive, and"
	cont "I will have to"
	cont "buy a new pair"
	cont "so I can't sell"
	cont "them for less"
	cont "than 9900¥."
	done
	 
	
SCDoYouWantItText:
	text "Do you want it?"
	done
SCAnythingElseText:
	text "Do you want to buy"
	line "anything else?"
	done
SCNotEnoughMoneyText:
	text "You don't have"
	line "enough money..."
	para "Please don't"
	line "waste my time."
	done
SCCancelText:
	text "Happy trails."
	done

SCPleaseComeAgainText:
	text "Please come again."
	done
	

DarkCaveBlackthornEntrancePharmacistText1:
	text "Whoa! You startled"
	line "me there!"

	para "I had my BLACK-"
	line "GLASSES on, so I"

	para "didn't notice you"
	line "at all."

	para "What am I doing"
	line "here?"

	para "Hey, don't you"
	line "worry about it."

	para "I'll give you a"
	line "pair of BLACK-"
	cont "GLASSES, so forget"
	cont "you saw me, OK?"
	done

DarkCaveBlackthornEntrancePharmacistText2:
	text "BLACKGLASSES ups"
	line "the power of dark-"
	cont "type moves."
	done

DarkCaveBlackthornEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, ROUTE_45, 1
	warp_event  3, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveBlackthornEntrancePharmacistScript, -1
	object_event 21, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceRevive, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	object_event  7, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMSnore, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_SNORE
	object_event 18, 27, SPRITE_UNUSED_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DarkCaveBlackthornEntranceStoneCuratorScript, -1
