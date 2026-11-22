extends Node2D
var rand = RandomNumberGenerator.new()

var chosenItemType
var chosenRarity
#rod variables
var maxWeight
var sizeProf
#bait variables
var luckModifier
var baitModifier
#bobber
var treasureModifier
#moved from being bait to bobber, to balance out benefits
var fishProf
@onready var fishTexture: TextureRect = $FishTexture
@onready var sprite2D: Sprite2D = $Sprite2D
#sets the player's stats to match 
func updateStats():
	match chosenItemType:
		global.ITEM_TYPE.ROD:
			global.maxWeight=maxWeight
			global.sizeProf=sizeProf
		global.ITEM_TYPE.BOBBER:
			global.treasureModifier = treasureModifier
			global.fishProf = fishProf
		global.ITEM_TYPE.BAIT:
			global.luckModifier = luckModifier
			global.baitModifier = baitModifier

func displayFish(chosenFishType):
	match chosenFishType:
		global.FISH_TYPE.RED_MEDIUM:
			var sprite = preload("res://minigame/fish_red_medium.png")
			fishTexture.texture = sprite
			
		global.FISH_TYPE.GOLD_MEDIUM:
			var sprite = preload("res://minigame/fish_gold_medium.png")
			fishTexture.texture = sprite
			
		global.FISH_TYPE.GREY_MEDIUM:
			var sprite = preload("res://minigame/fish_grey_medium.png")
			fishTexture.texture = sprite
			
		global.FISH_TYPE.RED_SMALL:
			var sprite = preload("res://minigame/fish_red_small.png")
			fishTexture.texture = sprite
		
		global.FISH_TYPE.YELLOW_SMALL:
			var sprite = preload("res://minigame/fish_yellow_small.png")
			fishTexture.texture = sprite
		
		global.FISH_TYPE.GREY_SMALL:
			var sprite = preload("res://minigame/fish_grey_small.png")
			fishTexture.texture = sprite
		
		global.FISH_TYPE.GREEN_BIG:
			var sprite = preload("res://minigame/fish_green_big.png")
			fishTexture.texture = sprite
		
		global.FISH_TYPE.PINK_BIG:
			var sprite = preload("res://minigame/fish_pink_big.png")
			fishTexture.texture = sprite
		
		global.FISH_TYPE.NONE:
			pass
		
		_:
			#This is to make it more clear that the script is not working
			var sprite = preload("res://minigame/treasure.png")
			fishTexture.texture = sprite
			
#selects an item type and gives it properties, to be assigned to the node
func chooseItem():
	chosenRarity = global.RARITY.values().pick_random()
	chosenItemType = global.ITEM_TYPE.values().pick_random()
	match chosenItemType:
		global.ITEM_TYPE.ROD:
			maxWeight = rand.randi_range(1,10)*(chosenRarity+1)
			sizeProf = global.SIZE_TYPE.values().pick_random()
			$"Label".refresh("MW: "+str(round(maxWeight)),"SP: "+global.getSizeName(sizeProf))
		
		global.ITEM_TYPE.BOBBER:
			treasureModifier = rand.randf_range(1,2)*(chosenRarity+1)
			fishProf = global.FISH_TYPE.values().pick_random()
			#line 2 is empty, as the fish proficiency will display seperately.
			$"Label".refresh("TM: "+str(round(treasureModifier)),"")
			displayFish(fishProf)
			fishTexture.visible = true
			
		global.ITEM_TYPE.BAIT:
			luckModifier =rand.randf_range(1,2)*(chosenRarity+1)
			baitModifier =rand.randf_range(1,2)*(chosenRarity+1)
			$"Label".refresh("LM: "+str(round(luckModifier)),"BM: "+str(round(baitModifier)))

func _ready():
	refresh()

#rerolls item properties, to be called at start and clicking reroll
func refresh():
	visible = true
	fishTexture.visible = false
	chooseItem()
	sprite2D.refresh()


func _on_item_button_pressed() -> void:
	updateStats()
