extends Node

#contains all global variables that should persist across screens

#round screen
var shipPos = Vector2(0,0)
var curRound = 0
var money = 100
var quota = 0
var quotaProgress = 0
var time = 300
var raining = false

func updateRoundVars():
	curRound+=1
	quota = (curRound**2)*50

func _ready():
	updateRoundVars()
