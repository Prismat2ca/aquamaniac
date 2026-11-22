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
	
	#compares distance between the two in both x and y
	if (abs(fishPos[0]-catchPos[0])<20) and (abs(fishPos[1]-catchPos[1])<20) and (global.maxWeight>=fish.weight or global.sizeProf == fish.size):
		if fish.chosenFishType == global.fishProf:
			bar.value+=2
		else:
			bar.value+=1
			
	else:
		bar.value-=1
	#checks if bar is at max value (0-500)
	if bar.value==0:	
		global.moveable = true
		get_parent().free()
	elif bar.value==500:
		global.quotaProgress += fish.sellPrice
		global.moveable = true
		get_parent().free()
		

#built in, runs repeatedly
func _physics_process(delta):
	updateProgress(delta)
