extends Node2D
var rand = RandomNumberGenerator.new()
@export var itemId = 0
func _init():
	itemId = rand.randi_range(1,3)
	
func refresh():
	itemId = rand.randi_range(1,3)
	$"Label".refresh()
	$"Sprite2D".refresh()
