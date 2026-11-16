extends Node2D
var rand = RandomNumberGenerator.new()
var birdScn = preload("res://round/bird.tscn")

func _physics_process(delta):
	var r = rand.randi_range(1,80)
	if r==10:
		var bird = birdScn.instantiate()
		add_child(bird)
	#var r2 = rand.randi_range(1,400)
	#if r2==10:
		#var circle = seaCircleScn.instantiate()
		#add_child(circle)
