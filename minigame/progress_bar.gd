extends TextureProgressBar
@onready var bar = $"."
@onready var catchCircle = $"../catchCircle"
@onready var fish = $"../Fish"

func setProgress(newProgress):
	bar.value = newProgress

#increments or decrements the bar value depending on positions of fish and cCircle
func updateProgress(delta):
	var fishPos = fish.position
	var catchPos = catchCircle.position
	
	#checks if bar is at max value (0-500)
	if bar.value==0 or bar.value==500:	
		get_tree().change_scene_to_file("res://round/round.tscn")
	#compares distance between the two in both x and y
	if (abs(fishPos[0]-catchPos[0])<20) and (abs(fishPos[1]-catchPos[1])<20) :
		bar.value+=1
	else:
		bar.value-=1


#built in, runs repeatedly
func _physics_process(delta):
	updateProgress(delta)
