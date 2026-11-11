extends CharacterBody2D

@export var speed = 10
var angle = 0
var acc = Vector2(0,0)
var vel = Vector2(0,0)

#takes in user movement and calculates acceleration and velocity.

func getInput():
	var inputDirection = Input.get_vector("left", "right", "up", "down")
	#changes the angle based on left and right input
	angle +=inputDirection[0]*PI/150
	
	#makes acceleration a vector based on the angle
	#then multiplied by the vertical user input
	acc= Vector2.from_angle(angle)*speed*-inputDirection[1]
	vel+=acc
	vel*=0.9
	velocity = -vel

#built in function that runs repeatedly
func _physics_process(delta):
	

	getInput()
	move_and_slide()



	


func _on_area_2d_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://shop/shop.tscn")
