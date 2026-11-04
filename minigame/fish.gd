extends CharacterBody2D

@export var speed = 1

var fishAcc = Vector2(0,0)
var fishVel = Vector2(0,0)
var rand = RandomNumberGenerator.new()
var targetPos = Vector2(0,0)
var unitVec = Vector2(0,0)
#tag to see if the fish is at the boundary
var bounds = false


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
	if rand.randi_range(0,100) ==0:
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
		
