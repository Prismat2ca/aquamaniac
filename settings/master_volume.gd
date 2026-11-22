extends HSlider

#saves value during instance of game
func _ready() -> void:
	if FileAccess.file_exists("user://masterVol.dat"):
		
		var file = FileAccess.open("user://masterVol.dat",FileAccess.READ)
		value = file.get_float()
		print(value)
		file.close()
	
	else:
	
		var file = FileAccess.open("user://masterVol.dat",FileAccess.WRITE)
		file.store_float(value)
		file.close()

#this lowers how often the function is called
#reducing how intensive it is
func _on_drag_ended(value_changed: bool) -> void:
	print(value)
	global.masterVol = value
	var file = FileAccess.open("user://masterVol.dat",FileAccess.WRITE)
	file.store_float(value)
	file.close()
	get_tree().get_first_node_in_group("sound").updateVol()
