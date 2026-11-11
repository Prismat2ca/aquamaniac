extends Label
@onready var item: Node2D = $".."
var price = 0
func _ready():
	#the sprite is given a different texture based on the itemID, to differentiate it for the user.
	
	match item.itemId:
		1:
			price = 50
		2:
			price = 100
		3:
			price = 200
		_:
			#This is to make it more clear that the script is not working
			price = -1
			
	text = str(price)
