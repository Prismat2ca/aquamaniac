extends RichTextLabel



@export var title = "Quota Progress: "
func _ready():
	refresh()
#updates to the current value of progress
func refresh():
	#displays the progress to the quota referencing the global script in form 100/1000 etc
	tooltip_text = "Max Weight: "+str(round(global.maxWeight))+"\nFish Prof: "+str(global.getFishName(global.fishProf))+"\nSize Prof: "+str(global.getSizeName(global.sizeProf))+"\nLuck Mod: "+str(round(global.luckModifier))+"\nTreasure Mod: "+str(round(global.treasureModifier))+"\nBait Mod: "+str(round(global.baitModifier))

func _physics_process(delta: float) -> void:
	refresh()
