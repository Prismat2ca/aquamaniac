extends CharacterBody2D

@export var speed = 1

var fishAcc = Vector2(0,0)
var fishVel = Vector2(0,0)
var rand = RandomNumberGenerator.new()
var targetPos = Vector2(0,0)
var unitVec = Vector2(0,0)
#tag to see if the fish is at the boundary
var bounds = false
var sellPrice = 10
var erratic = 1
var size = 1
var weight = 1
var progressMod = 1
var fishId = global.FISH_TYPE.RED_MEDIUM
var chosenFishType
var chosenRarity
var chosenSizeType

var commonFish = [global.FISH_TYPE.RED_MEDIUM,global.FISH_TYPE.RED_SMALL,global.FISH_TYPE.YELLOW_SMALL]
var uncommonFish = [global.FISH_TYPE.GREY_MEDIUM,global.FISH_TYPE.GREY_SMALL,global.FISH_TYPE.GREEN_BIG]
var rareFish = [global.FISH_TYPE.GOLD_MEDIUM,global.FISH_TYPE.PINK_BIG]

func decideFish():
	#decide what rarity fish with a weighted random roll
	var roll = randi_range(1,100)
	print(roll)
	if roll>=90:
		chosenRarity = global.RARITY.RARE
		chosenFishType = rareFish[randi_range(0,len(rareFish)-1)]
	elif roll>=60:
		chosenRarity = global.RARITY.UNCOMMON
		chosenFishType = uncommonFish[randi_range(0,len(uncommonFish)-1)]
	else:
		chosenRarity = global.RARITY.COMMON
		chosenFishType = commonFish[randi_range(0,len(commonFish)-1)]
	
	
	match chosenFishType:
		global.FISH_TYPE.RED_MEDIUM:
			var sprite = preload("res://minigame/fish_red_medium.png")
			$"Sprite2D".texture = sprite
			sellPrice = 10
			erratic = 1
			chosenSizeType = global.SIZE_TYPE.MEDIUM
		global.FISH_TYPE.GOLD_MEDIUM:
			var sprite = preload("res://minigame/fish_gold_medium.png")
			$"Sprite2D".texture = sprite
			sellPrice = 50
			erratic = 10
			chosenSizeType = global.SIZE_TYPE.MEDIUM
		global.FISH_TYPE.GREY_MEDIUM:
			var sprite = preload("res://minigame/fish_grey_medium.png")
			$"Sprite2D".texture = sprite
			sellPrice = 15
			erratic = 2
			chosenSizeType = global.SIZE_TYPE.MEDIUM
		global.FISH_TYPE.RED_SMALL:
			var sprite = preload("res://minigame/fish_red_small.png")
			$"Sprite2D".texture = sprite
			sellPrice = 18
			erratic = 3
			chosenSizeType = global.SIZE_TYPE.SMALL
		global.FISH_TYPE.YELLOW_SMALL:
			var sprite = preload("res://minigame/fish_yellow_small.png")
			$"Sprite2D".texture = sprite
			sellPrice = 10
			erratic = 2
			chosenSizeType = global.SIZE_TYPE.SMALL
		global.FISH_TYPE.GREY_SMALL:
			var sprite = preload("res://minigame/fish_grey_small.png")
			$"Sprite2D".texture = sprite
			sellPrice = 15
			erratic = 1
			chosenSizeType = global.SIZE_TYPE.SMALL
		global.FISH_TYPE.GREEN_BIG:
			var sprite = preload("res://minigame/fish_green_big.png")
			$"Sprite2D".texture = sprite
			sellPrice = 30
			erratic = 5
			chosenSizeType = global.SIZE_TYPE.BIG
		global.FISH_TYPE.PINK_BIG:
			var sprite = preload("res://minigame/fish_pink_big.png")
			$"Sprite2D".texture = sprite
			sellPrice = 40
			erratic = 4
			chosenSizeType = global.SIZE_TYPE.BIG
		_:
			#This is to make it more clear that the script is not working
			var sprite = preload("res://minigame/treasure.png")
			$"Sprite2D".texture = sprite
	
	#give random values of weight and size to produce variety
	size = randf_range(0.5,2)
	weight = randf_range(1,30)*size
	scale = Vector2(1,1)*size
	
	
	sellPrice*=size
	$WeightLabel.text = str(int(weight))
	

#gives coordinates for the fish to move to
func newTargetPos():
	var vectorX = rand.randi_range(115,215)
	var vectorY = rand.randi_range(30,130)
	
	targetPos = Vector2(vectorX,vectorY)

	return targetPos


func getDirection():
	
	fishAcc=Vector2(0,0)
	fishAcc= (unitVec*speed)
	
	fishVel+=fishAcc
	fishVel*=0.98
	velocity = fishVel

#creates a unit vector to point from the fish to the target position
func calcUnitVec(targetPos):
	var fishPos: Vector2 = $".".position
	var angle = fishPos.angle_to_point(targetPos)
	var vectorX = cos(angle)
	var vectorY = sin(angle)

	return Vector2(vectorX,vectorY)

#sets up a new target position and direction
func targetPosFunc():
	targetPos = newTargetPos()
	unitVec = calcUnitVec(targetPos)

func _ready():
	decideFish()
func _init():
	targetPosFunc()
	
#built in function that runs repeatedly
func _physics_process(delta):
	getDirection()
	move_and_slide()
	
	var distance: Vector2 = abs(targetPos-$".".position)
	
	#changes direction if the fish reaches its target position
	if distance.length()<=30:
		targetPosFunc()
	#adds a random chance for the fish to change direction
	if rand.randi_range(1,100) <=erratic:
		targetPosFunc()
	#attempts to revert the fish from walls
	if (($".".position[0] >210) or ($".".position[0] <120) or ($".".position[1] >120) or ($".".position[1] <20)):
		if not bounds:
			targetPosFunc()
			bounds = true
			fishVel*=-1
			unitVec*=-1
	else:
		bounds = false
		
