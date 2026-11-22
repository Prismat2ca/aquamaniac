extends TextureButton

@onready var sound: AudioStreamPlayer = $ButtonPress
#switches to the minigame screen
func _on_pressed() -> void:
	#resets the round so that it does not accumulate after finishing.
	global.curRound = 0
	get_tree().change_scene_to_file("res://shop/shop.tscn")
	
