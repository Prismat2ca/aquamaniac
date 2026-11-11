extends Node2D
var rand = RandomNumberGenerator.new()
@export var itemId = 0
func _init():
	itemId = rand.randi_range(1,3)
	
