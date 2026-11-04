extends CharacterBody2D

@export var speed = 1
var playerAcc = Vector2(0,0)
var playerVel = Vector2(0,0)



#takes in user movement and calculates acceleration and velocity.
func getInput():
	#gotten from godot docs
	var inputDirection = Input.get_vector("left", "right", "up", "down")
	$".".rotate(inputDirection[0]*PI/150)

	playerAcc= (inputDirection*speed)
	playerVel+=playerAcc
	playerVel*=0.9
	velocity = playerVel*0
	
		
	
	
#built in function that runs repeatedly
func _physics_process(delta):

	getInput()
	move_and_slide()


#
