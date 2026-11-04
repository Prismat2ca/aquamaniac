extends TextureProgressBar
@onready var bar = $"."
@onready var catchCircle = $"../catchCircle"
@onready var treasure = $"../treasure"
@onready var metTexture = load("res://minigame/treasure_progress_bar_met.png")
var runProgress = true

func setProgress(newProgress):
	bar.value = newProgress


#change value of bar depending on position of treasure and cCircle
func updateProgress():

	if runProgress:
		var treasurePos = treasure.position
		var catchPos = catchCircle.position
		
		#compares distance between the two in both x and y
		if (abs(treasurePos[0]-catchPos[0])<20) and (abs(treasurePos[1]-catchPos[1])<20) :
			bar.value+=1
		else:
			bar.value-=1
		
		#when bar reaches max, stop updating bar, and apply effects
		if bar.value==150:
			treasure.hide()
			bar.texture_progress = metTexture
			runProgress=false
	
func _physics_process(delta):
	updateProgress()
