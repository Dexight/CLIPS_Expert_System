;========================================================================
; Этот блок реализует логику обмена информацией с графической оболочкой,
; а также механизм остановки и повторного пуска машины вывода
; Русский текст в комментариях разрешён!

(deftemplate ioproxy  ; шаблон факта-посредника для обмена информацией с GUI
	(slot fact-id)        ; теоретически тут id факта для изменения
	(multislot answers)   ; возможные ответы
	(multislot messages)  ; исходящие сообщения
	(slot reaction)       ; возможные ответы пользователя
	(slot value)          ; выбор пользователя
	(slot restore)        ; забыл зачем это поле
)

; Собственно экземпляр факта ioproxy
(deffacts proxy-fact
	(ioproxy
		(fact-id 0112) ; это поле пока что не задействовано
		(value none)   ; значение пустое
		(messages)     ; мультислот messages изначально пуст
	)
)

(defrule clear-messages
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?proxy <- (ioproxy)
	=>
	(modify ?proxy (messages))
	(retract ?clear-msg-flg)
	(printout t "Messages cleared ..." crlf)	
)

(defrule set-output-and-halt
	(declare (salience 99))
	?current-message <- (sendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message set : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule append-output-and-halt
	(declare (salience 99))
	?current-message <- (appendmessagehalt ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message appended with : " ?new-msg " ... halting ..." crlf)
	(modify ?proxy (messages $?msg-list ?new-msg))
	(retract ?current-message)
	(halt)
)

(defrule set-output-and-proceed
	(declare (salience 99))
	?current-message <- (sendmessage ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message set : " ?new-msg crlf)
	(modify ?proxy (messages ?new-msg))
	(retract ?current-message)
)

(defrule append-output-and-proceed
	(declare (salience 99))
	?current-message <- (appendmessage ?new-msg)
	?proxy <- (ioproxy (messages $?msg-list))
	=>
	(printout t "Message appended with : " ?new-msg crlf)
	(modify ?proxy (messages $?msg-list ?new-msg))
	(retract ?current-message)
)

;======================================================================================
(defrule Hellstone_Bar_Craft1
	(item Hellstone)
	(item Obsidian)
	(item Hellforge)
	=>
	(assert (appendmessage "Hellstone_Bar = Hellstone + Obsidian + Hellforge"))
)

(defrule Lavaproof_Bug_Net_Craft1
	(item Hellstone_Bar)
	(item Bug_Net)
	(item Hellforge)
	=>
	(assert (appendmessage "Lavaproof_Bug_Net = Hellstone_Bar + Bug_Net + Hellforge"))
)

(defrule Flamarang_Craft1
	(item Hellstone_Bar)
	(item Enchanted_Boomerang)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Flamarang = Hellstone_Bar + Enchanted_Boomerang + Iron_Anvil"))
)

(defrule Hellfire_Arrow_Craft1
	(item Wooden_Arrow)
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Hellfire_Arrow = Wooden_Arrow + Hellstone_Bar + Iron_Anvil"))
)

(defrule Imp_Staff_Craft1
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Imp_Staff = Hellstone_Bar + Iron_Anvil"))
)

(defrule Molten_Breastplate_Craft1
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Molten_Breastplate = Hellstone_Bar + Iron_Anvil"))
)

(defrule Molten_Fury_Craft1
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Molten_Fury = Hellstone_Bar + Iron_Anvil"))
)

(defrule Molten_Greaves_Craft1
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Molten_Greaves = Hellstone_Bar + Iron_Anvil"))
)

(defrule Molten_Hamaxe_Craft1
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Molten_Hamaxe = Hellstone_Bar + Iron_Anvil"))
)

(defrule Molten_Helmet_Craft1
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Molten_Helmet = Hellstone_Bar + Iron_Anvil"))
)

(defrule Molten_Pickaxe_Craft1
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Molten_Pickaxe = Hellstone_Bar + Iron_Anvil"))
)

(defrule Phoenix_Blaster_Craft1
	(item Hellstone_Bar)
	(item Handgun)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Phoenix_Blaster = Hellstone_Bar + Handgun + Iron_Anvil"))
)

(defrule Sharanga_Craft1
	(item Molten_Fury)
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Sharanga = Molten_Fury + Hellstone_Bar + Iron_Anvil"))
)

(defrule Volcano_Craft1
	(item Hellstone_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Volcano = Hellstone_Bar + Iron_Anvil"))
)

(defrule Obsidian_Longcoat_Craft1
	(item Silk)
	(item Obsidian)
	(item Shadow_Scale)
	(item Hellforge)
	=>
	(assert (appendmessage "Obsidian_Longcoat = Silk + Obsidian + Shadow_Scale + Hellforge"))
)

(defrule Obsidian_Longcoat_Craft2
	(item Silk)
	(item Obsidian)
	(item Tissue_Sample)
	(item Hellforge)
	=>
	(assert (appendmessage "Obsidian_Longcoat = Silk + Obsidian + Tissue_Sample + Hellforge"))
)

(defrule Obsidian_Outlaw_Hat_Craft1
	(item Silk)
	(item Obsidian)
	(item Shadow_Scale)
	(item Hellforge)
	=>
	(assert (appendmessage "Obsidian_Outlaw_Hat = Silk + Obsidian + Shadow_Scale + Hellforge"))
)

(defrule Obsidian_Outlaw_Hat_Craft2
	(item Silk)
	(item Obsidian)
	(item Tissue_Sample)
	(item Hellforge)
	=>
	(assert (appendmessage "Obsidian_Outlaw_Hat = Silk + Obsidian + Tissue_Sample + Hellforge"))
)

(defrule Obsidian_Pants_Craft1
	(item Silk)
	(item Obsidian)
	(item Shadow_Scale)
	(item Hellforge)
	=>
	(assert (appendmessage "Obsidian_Pants = Silk + Obsidian + Shadow_Scale + Hellforge"))
)

(defrule Obsidian_Pants_Craft2
	(item Silk)
	(item Obsidian)
	(item Tissue_Sample)
	(item Hellforge)
	=>
	(assert (appendmessage "Obsidian_Pants = Silk + Obsidian + Tissue_Sample + Hellforge"))
)

(defrule Artery_Craft1
	(item Crimtane_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Artery = Crimtane_Bar + Iron_Anvil"))
)

(defrule Blood_Butcherer_Craft1
	(item Crimtane_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Blood_Butcherer = Crimtane_Bar + Iron_Anvil"))
)

(defrule Blood_Lust_Cluster_Craft1
	(item Crimtane_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Blood_Lust_Cluster = Crimtane_Bar + Iron_Anvil"))
)

(defrule Crimson_Greaves_Craft1
	(item Crimtane_Bar)
	(item Tissue_Sample)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Crimson_Greaves = Crimtane_Bar + Tissue_Sample + Iron_Anvil"))
)

(defrule Crimson_Helmet_Craft1
	(item Crimtane_Bar)
	(item Tissue_Sample)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Crimson_Helmet = Crimtane_Bar + Tissue_Sample + Iron_Anvil"))
)

(defrule Crimson_Scalemail_Craft1
	(item Crimtane_Bar)
	(item Tissue_Sample)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Crimson_Scalemail = Crimtane_Bar + Tissue_Sample + Iron_Anvil"))
)

(defrule Deathbringer_Pickaxe_Craft1
	(item Crimtane_Bar)
	(item Tissue_Sample)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Deathbringer_Pickaxe = Crimtane_Bar + Tissue_Sample + Iron_Anvil"))
)

(defrule Flesh_Grinder_Craft1
	(item Crimtane_Bar)
	(item Tissue_Sample)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Flesh_Grinder = Crimtane_Bar + Tissue_Sample + Iron_Anvil"))
)

(defrule Fleshcatcher_Craft1
	(item Crimtane_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Fleshcatcher = Crimtane_Bar + Iron_Anvil"))
)

(defrule Magiluminescence_Craft1
	(item Crimtane_Bar)
	(item Topaz)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Magiluminescence = Crimtane_Bar + Topaz + Iron_Anvil"))
)

(defrule Tendon_Bow_Craft1
	(item Crimtane_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Tendon_Bow = Crimtane_Bar + Iron_Anvil"))
)

(defrule The_Meatball_Craft1
	(item Crimtane_Bar)
	(item Tissue_Sample)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "The_Meatball = Crimtane_Bar + Tissue_Sample + Iron_Anvil"))
)

(defrule Crimtane_Bar_Craft1
	(item Crimtane_Ore)
	(item Furnace)
	=>
	(assert (appendmessage "Crimtane_Bar = Crimtane_Ore + Furnace"))
)

(defrule Demon_Bow_Craft1
	(item Demonite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Demon_Bow = Demonite_Bar + Iron_Anvil"))
)

(defrule Fisher_of_Souls_Craft1
	(item Demonite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Fisher_of_Souls = Demonite_Bar + Iron_Anvil"))
)

(defrule Light's_Bane_Craft1
	(item Demonite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Light's_Bane = Demonite_Bar + Iron_Anvil"))
)

(defrule Magiluminescence_Craft2
	(item Demonite_Bar)
	(item Topaz)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Magiluminescence = Demonite_Bar + Topaz + Iron_Anvil"))
)

(defrule Malaise_Craft1
	(item Demonite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Malaise = Demonite_Bar + Iron_Anvil"))
)

(defrule Nightmare_Pickaxe_Craft1
	(item Demonite_Bar)
	(item Shadow_Scale)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Nightmare_Pickaxe = Demonite_Bar + Shadow_Scale + Iron_Anvil"))
)

(defrule Shadow_Greaves_Craft1
	(item Demonite_Bar)
	(item Shadow_Scale)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Shadow_Greaves = Demonite_Bar + Shadow_Scale + Iron_Anvil"))
)

(defrule Shadow_Helmet_Craft1
	(item Demonite_Bar)
	(item Shadow_Scale)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Shadow_Helmet = Demonite_Bar + Shadow_Scale + Iron_Anvil"))
)

(defrule Shadow_Scalemail_Craft1
	(item Demonite_Bar)
	(item Shadow_Scale)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Shadow_Scalemail = Demonite_Bar + Shadow_Scale + Iron_Anvil"))
)

(defrule The_Breaker_Craft1
	(item Demonite_Bar)
	(item Shadow_Scale)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "The_Breaker = Demonite_Bar + Shadow_Scale + Iron_Anvil"))
)

(defrule War_Axe_of_the_Night_Craft1
	(item Demonite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "War_Axe_of_the_Night = Demonite_Bar + Iron_Anvil"))
)

(defrule Demonite_Bar_Craft1
	(item Demonite_Ore)
	(item Furnace)
	=>
	(assert (appendmessage "Demonite_Bar = Demonite_Ore + Furnace"))
)

(defrule Amazon_Craft1
	(item Rich_Mahogany)
	(item Stinger)
	(item Vine)
	(item Jungle_Spores)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Amazon = Rich_Mahogany + Stinger + Vine + Jungle_Spores + Iron_Anvil"))
)

(defrule Blade_of_Grass_Craft1
	(item Stinger)
	(item Jungle_Spores)
	(item Vine)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Blade_of_Grass = Stinger + Jungle_Spores + Vine + Iron_Anvil"))
)

(defrule Ivy_Whip_Craft1
	(item Jungle_Spores)
	(item Vine)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Ivy_Whip = Jungle_Spores + Vine + Iron_Anvil"))
)

(defrule Jungle_Hat_Craft1
	(item Jungle_Spores)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Jungle_Hat = Jungle_Spores + Iron_Anvil"))
)

(defrule Jungle_Pants_Craft1
	(item Jungle_Spores)
	(item Vine)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Jungle_Pants = Jungle_Spores + Vine + Iron_Anvil"))
)

(defrule Jungle_Shirt_Craft1
	(item Jungle_Spores)
	(item Stinger)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Jungle_Shirt = Jungle_Spores + Stinger + Iron_Anvil"))
)

(defrule Snapthorn_Craft1
	(item Stinger)
	(item Vine)
	(item Jungle_Spores)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Snapthorn = Stinger + Vine + Jungle_Spores + Iron_Anvil"))
)

(defrule Thorn_Chakram_Craft1
	(item Jungle_Spores)
	(item Stinger)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Thorn_Chakram = Jungle_Spores + Stinger + Iron_Anvil"))
)

(defrule Axe_of_Regrowth_Craft1
	(item Staff_of_Regrowth)
	(item Copper_Axe)
	(item Jungle_Spores)
	(item Vine)
	(item Work_Bench)
	=>
	(assert (appendmessage "Axe_of_Regrowth = Staff_of_Regrowth + Copper_Axe + Jungle_Spores + Vine + Work_Bench"))
)

(defrule Jungle_Torch_Craft1
	(item Torch)
	(item Jungle_Spores)
	=>
	(assert (appendmessage "Jungle_Torch = Torch + Jungle_Spores"))
)

(defrule Iron_Anvil_Craft1
	(item Iron_Bar)
	(item Work_Bench)
	=>
	(assert (appendmessage "Iron_Anvil = Iron_Bar + Work_Bench"))
)

(defrule Work_Bench_Craft1
	(item Wood)
	=>
	(assert (appendmessage "Work_Bench = Wood"))
)

(defrule Iron_Bar_Craft1
	(item Iron_Ore)
	(item Furnace)
	=>
	(assert (appendmessage "Iron_Bar = Iron_Ore + Furnace"))
)

(defrule Furnace_Craft1
	(item Stone_Block)
	(item Wood)
	(item Torch)
	(item Work_Bench)
	=>
	(assert (appendmessage "Furnace = Stone_Block + Wood + Torch + Work_Bench"))
)

(defrule Torch_Craft1
	(item Gel)
	(item Wood)
	=>
	(assert (appendmessage "Torch = Gel + Wood"))
)

(defrule Furnace_Craft2
	(item Hellforge)
	=>
	(assert (appendmessage "Furnace = Hellforge"))
)

(defrule Blue_Phaseblade_Craft1
	(item Meteorite_Bar)
	(item Sapphire)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Blue_Phaseblade = Meteorite_Bar + Sapphire + Iron_Anvil"))
)

(defrule Green_Phaseblade_Craft1
	(item Meteorite_Bar)
	(item Emerald)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Green_Phaseblade = Meteorite_Bar + Emerald + Iron_Anvil"))
)

(defrule Meteor_Hamaxe_Craft1
	(item Meteorite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Meteor_Hamaxe = Meteorite_Bar + Iron_Anvil"))
)

(defrule Meteor_Helmet_Craft1
	(item Meteorite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Meteor_Helmet = Meteorite_Bar + Iron_Anvil"))
)

(defrule Meteor_Leggings_Craft1
	(item Meteorite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Meteor_Leggings = Meteorite_Bar + Iron_Anvil"))
)

(defrule Meteor_Suit_Craft1
	(item Meteorite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Meteor_Suit = Meteorite_Bar + Iron_Anvil"))
)

(defrule Purple_Phaseblade_Craft1
	(item Meteorite_Bar)
	(item Amethyst)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Purple_Phaseblade = Meteorite_Bar + Amethyst + Iron_Anvil"))
)

(defrule Orange_Phaseblade_Craft1
	(item Meteorite_Bar)
	(item Amber)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Orange_Phaseblade = Meteorite_Bar + Amber + Iron_Anvil"))
)

(defrule Red_Phaseblade_Craft1
	(item Meteorite_Bar)
	(item Ruby)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Red_Phaseblade = Meteorite_Bar + Ruby + Iron_Anvil"))
)

(defrule Space_Gun_Craft1
	(item Meteorite_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Space_Gun = Meteorite_Bar + Iron_Anvil"))
)

(defrule Star_Cannon_Craft1
	(item Minishark)
	(item Meteorite_Bar)
	(item Fallen_Star)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Star_Cannon = Minishark + Meteorite_Bar + Fallen_Star + Iron_Anvil"))
)

(defrule White_Phaseblade_Craft1
	(item Meteorite_Bar)
	(item Diamond)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "White_Phaseblade = Meteorite_Bar + Diamond + Iron_Anvil"))
)

(defrule Yellow_Phaseblade_Craft1
	(item Meteorite_Bar)
	(item Topaz)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Yellow_Phaseblade = Meteorite_Bar + Topaz + Iron_Anvil"))
)

(defrule Meteorite_Bar_Craft1
	(item Meteorite)
	(item Furnace)
	=>
	(assert (appendmessage "Meteorite_Bar = Meteorite + Furnace"))
)

(defrule Bee_Breastplate_Craft1
	(item Bee_Wax)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Bee_Breastplate = Bee_Wax + Iron_Anvil"))
)

(defrule Bee_Greaves_Craft1
	(item Bee_Wax)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Bee_Greaves = Bee_Wax + Iron_Anvil"))
)

(defrule Bee_Headgear_Craft1
	(item Bee_Wax)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Bee_Headgear = Bee_Wax + Iron_Anvil"))
)

(defrule Beenade_Craft1
	(item Grenade)
	(item Bee_Wax)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Beenade = Grenade + Bee_Wax + Iron_Anvil"))
)

(defrule Hive-Five_Craft1
	(item Bee_Wax)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Hive-Five = Bee_Wax + Iron_Anvil"))
)

(defrule Hornet_Staff_Craft1
	(item Bee_Wax)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Hornet_Staff = Bee_Wax + Iron_Anvil"))
)

(defrule Amber_Staff_Craft1
	(item Sturdy_Fossil)
	(item Amber)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Amber_Staff = Sturdy_Fossil + Amber + Iron_Anvil"))
)

(defrule Bone_Javelin_Craft1
	(item Sturdy_Fossil)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Bone_Javelin = Sturdy_Fossil + Iron_Anvil"))
)

(defrule Bone_Throwing_Knife_Craft1
	(item Sturdy_Fossil)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Bone_Throwing_Knife = Sturdy_Fossil + Iron_Anvil"))
)

(defrule Fossil_Greaves_Craft1
	(item Sturdy_Fossil)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Fossil_Greaves = Sturdy_Fossil + Iron_Anvil"))
)

(defrule Fossil_Helmet_Craft1
	(item Sturdy_Fossil)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Fossil_Helmet = Sturdy_Fossil + Iron_Anvil"))
)

(defrule Fossil_Pickaxe_Craft1
	(item Sturdy_Fossil)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Fossil_Pickaxe = Sturdy_Fossil + Wood + Iron_Anvil"))
)

(defrule Fossil_Plate_Craft1
	(item Sturdy_Fossil)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Fossil_Plate = Sturdy_Fossil + Iron_Anvil"))
)

(defrule Scarab_Bomb_Craft1
	(item Bomb)
	(item Sturdy_Fossil)
	=>
	(assert (appendmessage "Scarab_Bomb = Bomb + Sturdy_Fossil"))
)

(defrule Night's_Edge_Craft1
	(item Light's_Bane)
	(item Muramasa)
	(item Blade_of_Grass)
	(item Volcano)
	(item Demon_Altar)
	=>
	(assert (appendmessage "Night's_Edge = Light's_Bane + Muramasa + Blade_of_Grass + Volcano + Demon_Altar"))
)

(defrule Night's_Edge_Craft2
	(item Blood_Butcherer)
	(item Muramasa)
	(item Blade_of_Grass)
	(item Volcano)
	(item Demon_Altar)
	=>
	(assert (appendmessage "Night's_Edge = Blood_Butcherer + Muramasa + Blade_of_Grass + Volcano + Demon_Altar"))
)

(defrule Chain_Craft1
	(item Iron_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Chain = Iron_Bar + Iron_Anvil"))
)

(defrule Sawmill_Craft1
	(item Wood)
	(item Iron_Bar)
	(item Chain)
	(item Work_Bench)
	=>
	(assert (appendmessage "Sawmill = Wood + Iron_Bar + Chain + Work_Bench"))
)

(defrule Glass_Craft1
	(item Glass_Platform)
	=>
	(assert (appendmessage "Glass = Glass_Platform"))
)

(defrule Glass_Platform_Craft1
	(item Glass)
	=>
	(assert (appendmessage "Glass_Platform = Glass"))
)

(defrule Glass_Craft2
	(item Sand)
	(item Furnace)
	=>
	(assert (appendmessage "Glass = Sand + Furnace"))
)

(defrule Glass_Craft3
	(item Glass_Wall)
	(item Work_Bench)
	=>
	(assert (appendmessage "Glass = Glass_Wall + Work_Bench"))
)

(defrule Glass_Wall_Craft1
	(item Glass)
	(item Work_Bench)
	=>
	(assert (appendmessage "Glass_Wall = Glass + Work_Bench"))
)

(defrule Silk_Craft1
	(item Cobweb)
	(item Loom)
	=>
	(assert (appendmessage "Silk = Cobweb + Loom"))
)

(defrule Loom_Craft1
	(item Wood)
	(item Sawmill)
	=>
	(assert (appendmessage "Loom = Wood + Sawmill"))
)

(defrule Bed_Craft1
	(item Wood)
	(item Silk)
	(item Sawmill)
	=>
	(assert (appendmessage "Bed = Wood + Silk + Sawmill"))
)

(defrule Bookcase_Craft1
	(item Wood)
	(item Book)
	(item Sawmill)
	=>
	(assert (appendmessage "Bookcase = Wood + Book + Sawmill"))
)

(defrule Dresser_Craft1
	(item Wood)
	(item Sawmill)
	=>
	(assert (appendmessage "Dresser = Wood + Sawmill"))
)

(defrule Grandfather_Clock_Craft1
	(item Iron_Bar)
	(item Glass)
	(item Wood)
	(item Sawmill)
	=>
	(assert (appendmessage "Grandfather_Clock = Iron_Bar + Glass + Wood + Sawmill"))
)

(defrule Piano_Craft1
	(item Bone)
	(item Wood)
	(item Book)
	(item Sawmill)
	=>
	(assert (appendmessage "Piano = Bone + Wood + Book + Sawmill"))
)

(defrule Sofa_Craft1
	(item Wood)
	(item Silk)
	(item Sawmill)
	=>
	(assert (appendmessage "Sofa = Wood + Silk + Sawmill"))
)

(defrule Chest_Craft1
	(item Wood)
	(item Iron_Bar)
	(item Work_Bench)
	=>
	(assert (appendmessage "Chest = Wood + Iron_Bar + Work_Bench"))
)

(defrule Wood_Wall_Craft1
	(item Wood)
	(item Work_Bench)
	=>
	(assert (appendmessage "Wood_Wall = Wood + Work_Bench"))
)

(defrule Wooden_Chair_Craft1
	(item Wood)
	(item Work_Bench)
	=>
	(assert (appendmessage "Wooden_Chair = Wood + Work_Bench"))
)

(defrule Wooden_Door_Craft1
	(item Wood)
	(item Work_Bench)
	=>
	(assert (appendmessage "Wooden_Door = Wood + Work_Bench"))
)

(defrule Wooden_Table_Craft1
	(item Wood)
	(item Work_Bench)
	=>
	(assert (appendmessage "Wooden_Table = Wood + Work_Bench"))
)

(defrule Wooden_Arrow_Craft1
	(item Wood)
	(item Stone_Block)
	(item Work_Bench)
	=>
	(assert (appendmessage "Wooden_Arrow = Wood + Stone_Block + Work_Bench"))
)

(defrule Wood_Craft1
	(item Wood_Platform)
	=>
	(assert (appendmessage "Wood = Wood_Platform"))
)

(defrule Wood_Platform_Craft1
	(item Wood)
	=>
	(assert (appendmessage "Wood_Platform = Wood"))
)

(defrule Copper_Bar_Craft1
	(item Copper_Ore)
	(item Furnace)
	=>
	(assert (appendmessage "Copper_Bar = Copper_Ore + Furnace"))
)

(defrule Silver_Bar_Craft1
	(item Silver_Ore)
	(item Furnace)
	=>
	(assert (appendmessage "Silver_Bar = Silver_Ore + Furnace"))
)

(defrule Gold_Bar_Craft1
	(item Gold_Ore)
	(item Furnace)
	=>
	(assert (appendmessage "Gold_Bar = Gold_Ore + Furnace"))
)

(defrule Amethyst_Staff_Craft1
	(item Copper_Bar)
	(item Amethyst)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Amethyst_Staff = Copper_Bar + Amethyst + Iron_Anvil"))
)

(defrule Copper_Axe_Craft1
	(item Copper_Bar)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Copper_Axe = Copper_Bar + Wood + Iron_Anvil"))
)

(defrule Copper_Bow_Craft1
	(item Copper_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Copper_Bow = Copper_Bar + Iron_Anvil"))
)

(defrule Copper_Broadsword_Craft1
	(item Copper_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Copper_Broadsword = Copper_Bar + Iron_Anvil"))
)

(defrule Copper_Chainmail_Craft1
	(item Copper_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Copper_Chainmail = Copper_Bar + Iron_Anvil"))
)

(defrule Copper_Greaves_Craft1
	(item Copper_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Copper_Greaves = Copper_Bar + Iron_Anvil"))
)

(defrule Copper_Hammer_Craft1
	(item Copper_Bar)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Copper_Hammer = Copper_Bar + Wood + Iron_Anvil"))
)

(defrule Copper_Helmet_Craft1
	(item Copper_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Copper_Helmet = Copper_Bar + Iron_Anvil"))
)

(defrule Copper_Pickaxe_Craft1
	(item Copper_Bar)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Copper_Pickaxe = Copper_Bar + Wood + Iron_Anvil"))
)

(defrule Copper_Shortsword_Craft1
	(item Copper_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Copper_Shortsword = Copper_Bar + Iron_Anvil"))
)

(defrule Copper_Watch_Craft1
	(item Copper_Bar)
	(item Chain)
	(item Wooden_Table)
	(item Wooden_Chair)
	=>
	(assert (appendmessage "Copper_Watch = Copper_Bar + Chain + Wooden_Table + Wooden_Chair"))
)

(defrule Sapphire_Staff_Craft1
	(item Silver_Bar)
	(item Sapphire)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Sapphire_Staff = Silver_Bar + Sapphire + Iron_Anvil"))
)

(defrule Silver_Axe_Craft1
	(item Silver_Bar)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Axe = Silver_Bar + Wood + Iron_Anvil"))
)

(defrule Silver_Bow_Craft1
	(item Silver_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Bow = Silver_Bar + Iron_Anvil"))
)

(defrule Silver_Broadsword_Craft1
	(item Silver_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Broadsword = Silver_Bar + Iron_Anvil"))
)

(defrule Silver_Bullet_Craft1
	(item Musket_Ball)
	(item Silver_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Bullet = Musket_Ball + Silver_Bar + Iron_Anvil"))
)

(defrule Silver_Chainmail_Craft1
	(item Silver_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Chainmail = Silver_Bar + Iron_Anvil"))
)

(defrule Silver_Greaves_Craft1
	(item Silver_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Greaves = Silver_Bar + Iron_Anvil"))
)

(defrule Silver_Hammer_Craft1
	(item Silver_Bar)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Hammer = Silver_Bar + Wood + Iron_Anvil"))
)

(defrule Silver_Helmet_Craft1
	(item Silver_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Helmet = Silver_Bar + Iron_Anvil"))
)

(defrule Silver_Pickaxe_Craft1
	(item Silver_Bar)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Pickaxe = Silver_Bar + Wood + Iron_Anvil"))
)

(defrule Silver_Shortsword_Craft1
	(item Silver_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Silver_Shortsword = Silver_Bar + Iron_Anvil"))
)

(defrule Silver_Watch_Craft1
	(item Silver_Bar)
	(item Chain)
	(item Wooden_Table)
	(item Wooden_Chair)
	=>
	(assert (appendmessage "Silver_Watch = Silver_Bar + Chain + Wooden_Table + Wooden_Chair"))
)

(defrule Magic_Mirror_Craft1
	(item Glass)
	(item Gold_Bar)
	(item Diamond)
	(item Furnace)
	=>
	(assert (appendmessage "Magic_Mirror = Glass + Gold_Bar + Diamond + Furnace"))
)

(defrule Gold_Axe_Craft1
	(item Gold_Bar)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Axe = Gold_Bar + Wood + Iron_Anvil"))
)

(defrule Gold_Bow_Craft1
	(item Gold_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Bow = Gold_Bar + Iron_Anvil"))
)

(defrule Gold_Broadsword_Craft1
	(item Gold_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Broadsword = Gold_Bar + Iron_Anvil"))
)

(defrule Gold_Chainmail_Craft1
	(item Gold_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Chainmail = Gold_Bar + Iron_Anvil"))
)

(defrule Gold_Crown_Craft1
	(item Gold_Bar)
	(item Ruby)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Crown = Gold_Bar + Ruby + Iron_Anvil"))
)

(defrule Gold_Greaves_Craft1
	(item Gold_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Greaves = Gold_Bar + Iron_Anvil"))
)

(defrule Gold_Hammer_Craft1
	(item Gold_Bar)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Hammer = Gold_Bar + Wood + Iron_Anvil"))
)

(defrule Gold_Helmet_Craft1
	(item Gold_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Helmet = Gold_Bar + Iron_Anvil"))
)

(defrule Gold_Pickaxe_Craft1
	(item Gold_Bar)
	(item Wood)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Pickaxe = Gold_Bar + Wood + Iron_Anvil"))
)

(defrule Gold_Shortsword_Craft1
	(item Gold_Bar)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Gold_Shortsword = Gold_Bar + Iron_Anvil"))
)

(defrule Ruby_Staff_Craft1
	(item Gold_Bar)
	(item Ruby)
	(item Iron_Anvil)
	=>
	(assert (appendmessage "Ruby_Staff = Gold_Bar + Ruby + Iron_Anvil"))
)

(defrule Flinx_Fur_Coat_Craft1
	(item Silk)
	(item Flinx_Fur)
	(item Gold_Bar)
	(item Loom)
	=>
	(assert (appendmessage "Flinx_Fur_Coat = Silk + Flinx_Fur + Gold_Bar + Loom"))
)

(defrule Gold_Watch_Craft1
	(item Gold_Bar)
	(item Chain)
	(item Wooden_Table)
	(item Wooden_Chair)
	=>
	(assert (appendmessage "Gold_Watch = Gold_Bar + Chain + Wooden_Table + Wooden_Chair"))
)

(defrule Flinx_Staff_Craft1
	(item Flinx_Fur)
	(item Gold_Bar)
	(item Work_Bench)
	=>
	(assert (appendmessage "Flinx_Staff = Flinx_Fur + Gold_Bar + Work_Bench"))
)

(defrule Necro_Breastplate_Craft1
	(item Bone)
	(item Cobweb)
	(item Work_Bench)
	=>
	(assert (appendmessage "Necro_Breastplate = Bone + Cobweb + Work_Bench"))
)

(defrule Necro_Greaves_Craft1
	(item Bone)
	(item Cobweb)
	(item Work_Bench)
	=>
	(assert (appendmessage "Necro_Greaves = Bone + Cobweb + Work_Bench"))
)

(defrule Necro_Helmet_Craft1
	(item Bone)
	(item Cobweb)
	(item Work_Bench)
	=>
	(assert (appendmessage "Necro_Helmet = Bone + Cobweb + Work_Bench"))
)

(defrule Spinal_Tap_Craft1
	(item Bone)
	(item Cobweb)
	(item Work_Bench)
	=>
	(assert (appendmessage "Spinal_Tap = Bone + Cobweb + Work_Bench"))
)
