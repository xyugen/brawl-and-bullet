@tool
class_name Job
extends Node

var stats : Node

@export var starting_stats : StatSheet

func initialize(job_owner : CharacterBody2D):
	owner = job_owner

func _ready():
	stats = get_node("Stats")
	stats.initialize(starting_stats)
