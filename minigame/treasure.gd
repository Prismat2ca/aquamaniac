extends Sprite2D
var rand = RandomNumberGenerator.new()
#move the treasure to a random position within the container at start
func _init():
	var posX = rand.randi_range(115,215)
	var posY = rand.randi_range(30,130)
		
	var treasurePos = Vector2(posX,posY)
	$".".position = treasurePos
