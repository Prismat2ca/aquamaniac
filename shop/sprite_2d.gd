extends Sprite2D
@onready var item: Node2D = $".."


func _ready():
	refresh()

func refresh():
	#the sprite is given a different texture based on the itemID, to differentiate it for the user.
	match item.itemId:
		1:
			var sprite = preload("res://shop/item1.png")
			texture = sprite
		2:
			var sprite = preload("res://shop/item2.png")
			texture = sprite
		3:
			var sprite = preload("res://shop/item3.png")
			texture = sprite
		_:
			#This is to make it more clear that the script is not working
			var sprite = preload("res://minigame/fish.png")
			texture = sprite
