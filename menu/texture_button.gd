extends TextureButton

#switches to the minigame screen
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://shop/shop.tscn")
