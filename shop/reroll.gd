extends TextureButton
@onready var globalScript = $"/root/global"
var cost = 10
func _on_pressed() -> void:
	
	#must rereference this way to change the global value, not a copy.
	if globalScript.money>=cost:
		globalScript.money-=cost
		var Items = get_tree().get_nodes_in_group("Items")
		for item in Items:
			item.refresh()
		$"../money".updateDisplay()
		
		#prevents too many rerolls within a single shop
		cost+=10
	
