extends Label
@onready var item: Node2D = $".."
var price = 0
func _ready():
	pass
	#the sprite is given a different texture based on the itemID, to differentiate it for the user.
	#refresh()
	
#seperate function so it can be called later without repeating the code.
func refresh(line1: String, line2: String):
		
	match item.chosenRarity:
		global.RARITY.COMMON:
			price = 50
		global.RARITY.UNCOMMON:
			price = 100
		global.RARITY.RARE:
			price = 200
		_:
			#This is to make it more clear that the script is not working
			price = -1
	
	text = str(price)+"D"+"\n"+(line1)+"\n"+(line2)
