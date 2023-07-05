extends Node2D

# Array to hold references to the player characters
var players : Array[CharacterBody2D]
var camera : Camera2D

func _ready():
	camera = get_node("Camera2D")
	get_players()
	
func _physics_process(_delta):
	camera.position = get_center()

# Function to retrieve player characters from the scene
func get_players() -> void:
	# Iterate through the children of the scene
	for child in get_children():
		# Check if the child is in the "Players" group and is of type CharacterBody2D
		if child.is_in_group("Players") && child is CharacterBody2D:
			# Add the player character to the array
			players.push_back(child)

# Calculates the center position of all player characters
func get_center() -> Vector2:
	# Variables to hold the sum of positions
	var center_x : float = 0.0
	var center_y : float = 0.0

	# Iterate over each player character and accumulate their positions
	for player in players:
		center_x += player.position.x
		center_y += player.position.y

	# Calculate the average position
	center_x /= players.size()
	center_y /= players.size()

	# Return the center position as a Vector2
	return Vector2(center_x, center_y)
