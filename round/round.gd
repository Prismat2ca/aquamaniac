extends Node2D
var rand = RandomNumberGenerator.new()
var birdScn = preload("res://round/bird.tscn")

func _physics_process(delta):
	var r = rand.randi_range(1,300)
	if r==10:
		var bird = birdScn.instantiate()
		add_child(bird)
