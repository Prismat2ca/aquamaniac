extends Control

func _physics_process(_delta):
	if Input.is_action_just_pressed("escape") and get_tree().get_first_node_in_group("settings")==null:
		free()
