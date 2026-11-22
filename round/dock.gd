extends CharacterBody2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if global.quotaProgress>= global.quota:
		get_tree().change_scene_to_file("res://shop/shop.tscn")
