extends Sprite2D
var sizeIncrement = 0
func _physics_process(delta: float) -> void:
	scale[1]=1-(abs(sin(sizeIncrement))*0.15)
	sizeIncrement+=delta
