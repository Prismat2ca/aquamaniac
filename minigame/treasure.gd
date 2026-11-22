extends Sprite2D
var rand = RandomNumberGenerator.new()
#move the treasure to a random position within the container at start
func _init():
	var spawnChance = rand.randi_range(1,10)
	if (spawnChance <= global.treasureModifier):
		#gives a unique position, making it less predictable
		var posX = rand.randi_range(115,215)
		var posY = rand.randi_range(30,130)
			
		var treasurePos = Vector2(posX,posY)
		position = treasurePos
	else:
		
		visible = false
