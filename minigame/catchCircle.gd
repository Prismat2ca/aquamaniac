extends CharacterBody2D

@export var speed = 1
var playerAcc = Vector2(0,0)
var playerVel = Vector2(0,0)
var bounds = false
#takes in user movement and calculates acceleration and velocity.
func getInput():
	#gotten from godot docs
	var inputDirection = Input.get_vector("left", "right", "up", "down")
	playerAcc= (inputDirection*speed)
	playerVel+=playerAcc
	playerVel*=0.995
	velocity = playerVel

	if (($".".position[0] >210) or ($".".position[0] <120) or ($".".position[1] >130) or ($".".position[1] <30)):
		if not bounds:
			playerVel*=-0.5
			
		bounds = true
	else:
		bounds = false
		
	print("Velocity: ",playerVel)
#built in function that runs repeatedly
func _physics_process(delta):

	getInput()
	move_and_slide()
