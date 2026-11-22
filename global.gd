extends Node
var rand = RandomNumberGenerator.new()
#contains all global variables that should persist across screens

#round screen
var shipPos = Vector2(0,0)
var curRound = 0
var money = 0
var quota = 0
var quotaProgress = 0
var time = 300
var raining = false
var moveable = true
#items

#rod variables
var maxWeight = 10
var sizeProf = SIZE_TYPE.NONE
#bait variables
var luckModifier = 1
var baitModifier = 1
#bobber
var treasureModifier = 1
var fishProf = FISH_TYPE.NONE

#Increases readability of values
enum DIFFICULTY_TYPE {EASY,NORMAL,HARD}
enum FISH_TYPE {RED_MEDIUM,GOLD_MEDIUM,GREY_MEDIUM,RED_SMALL,YELLOW_SMALL,GREY_SMALL,GREEN_BIG,PINK_BIG,NONE}
enum RARITY {COMMON,UNCOMMON,RARE}
enum ITEM_TYPE {ROD,BOBBER,BAIT}
enum SIZE_TYPE {SMALL,MEDIUM,BIG,NONE}

#menu
var musicVol = 0
var masterVol = 0
var volumeToggle = true
var difficulty = DIFFICULTY_TYPE.NORMAL

func getSizeName(id):
	match id:
		SIZE_TYPE.SMALL:
			return "Small"
		SIZE_TYPE.MEDIUM:
			return "Medium"
		SIZE_TYPE.BIG:
			return "Big"
		SIZE_TYPE.NONE:
			return "None"
		
func getFishName(id):
	match id:
		FISH_TYPE.RED_MEDIUM:
			return "Medium red"
		FISH_TYPE.GOLD_MEDIUM:
			return "Medium gold"
		FISH_TYPE.GREY_MEDIUM:
			return "Medium grey"
		FISH_TYPE.RED_SMALL:
			return "Small red"
		FISH_TYPE.YELLOW_SMALL:
			return "Small yellow"
		FISH_TYPE.GREY_SMALL:
			return "Small grey"
		FISH_TYPE.GREEN_BIG:
			return "Big green"
		FISH_TYPE.PINK_BIG:
			return "Big pink"
		FISH_TYPE.NONE:
			return "None"

#increases reusability, by having parameters of file and its value
#updates stored variables to keep them consistent across loads
func getFile(fileName,value):
	if FileAccess.file_exists(fileName):
		
		var file = FileAccess.open(fileName,FileAccess.READ)
		value = file.get_float()
		
		file.close()
	
	else:
	
		var file = FileAccess.open(fileName,FileAccess.WRITE)
		file.store_float(value)
		file.close()
	return value

#adds the scaling challenge for each round
#as well as providing functionality for resetting variables etc
func updateRoundVars():
	curRound+=1
	#the player is given money for anything over the required quota
	#rewards them for playing better
	money+=(quotaProgress-quota)
	quotaProgress=0
	
	raining=false
	if rand.randi_range(1,2)==1:
		raining=true
	
	#changes time and quota based on the difficulty
	#increasing or decreasing challenge

	match difficulty:
		DIFFICULTY_TYPE.HARD:
			time = 200
			#makes quota increase every round, based on the graph in design
			quota = (curRound**2)*100
		DIFFICULTY_TYPE.NORMAL:
			time = 200
			quota = (curRound**2)*50
		_:
			time = 300
			quota = (curRound**2)*50


func _ready():
	musicVol = getFile("user://musicVol.dat",musicVol)
	masterVol = getFile("user://masterVol.dat",masterVol)
	#access the difficulty file, so it is copied upon load, saving choices
	var diffFile = FileAccess.open("user://difficulty.dat",FileAccess.READ)
	difficulty = diffFile.get_float()
		
	diffFile.close()
