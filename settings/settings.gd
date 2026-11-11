extends Control

func _physics_process(_delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://options/options.tscn")
