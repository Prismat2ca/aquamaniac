extends Node2D
var rand = RandomNumberGenerator.new()
var birdScn = preload("res://round/bird.tscn")
var spawnScn = preload("res://round/spawn_scene.tscn")
var spawnRate = 200


func _ready() -> void:
	#makes the weather effect gameplay
	#by increasing how many spawns appear
	if global.raining:
		spawnRate = 100
		
	spawnRate/=global.baitModifier

	var rainParticles = get_tree().get_nodes_in_group("Rain")
	for node in rainParticles:
		node.emitting = global.raining
	

func _physics_process(_delta):
	#creates bird nodes at random
	var r = rand.randi_range(1,80)
	if r==10:
		var bird = birdScn.instantiate()
		add_child(bird)
	if global.time <=0:
		if global.quotaProgress >= global.quota:
			get_tree().change_scene_to_file("res://shop/shop.tscn")
		else:
			get_tree().change_scene_to_file("res://menu/menu.tscn")
	#creates spawn nodes at random
	var r2 = rand.randi_range(1,spawnRate)
	if r2==10:
		var spawn = spawnScn.instantiate()
		add_child(spawn)
