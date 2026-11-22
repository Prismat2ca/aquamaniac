extends Control

func _physics_process(_delta):
	if Input.is_action_just_pressed("escape"):
		free()
