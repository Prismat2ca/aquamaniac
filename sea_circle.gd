extends Node2D

var rand = RandomNumberGenerator.new()
var scaleTarget = 0
func _ready():
	#the position needs to be relative to the ship
	position = Vector2(rand.randi_range(-160,160)+global.shipPos[0],rand.randi_range(-160,160)+global.shipPos[1])
	scale = Vector2(0,0)
func _physics_process(delta: float) -> void:
	var r = randi_range(1,200)
	if r == 10:
		scaleTarget = randf_range(0.01,0.5)
	scale = ((scale*50)+Vector2(1,1)*scaleTarget)/51
