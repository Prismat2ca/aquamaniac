extends Sprite2D
@onready var item: Node2D = $".."


func _ready():
	refresh()

func refresh():
	#the sprite is given a different texture based on the item type, to differentiate it for the user.
	match item.chosenItemType:
		global.ITEM_TYPE.ROD:
			var sprite = preload("res://shop/item_rod.png")
			texture = sprite
		global.ITEM_TYPE.BAIT:
			var sprite = preload("res://shop/item_bait.png")
			texture = sprite
		global.ITEM_TYPE.BOBBER:
			var sprite = preload("res://shop/item_bobber.png")
			texture = sprite
		_:
			#This is to make it more clear that the script is not working
			var sprite = preload("res://minigame/fish.png")
			texture = sprite
