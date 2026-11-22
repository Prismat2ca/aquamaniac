extends AudioStreamPlayer
func updateVol():
	if global.volumeToggle:
		volume_db = global.musicVol+global.masterVol
	else:
		playing = false
func _ready() -> void:
	updateVol()
