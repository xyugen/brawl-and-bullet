class_name CharacterStats
extends Node

var level : int
var max_health : int
var health : int
var damage : int
var speed : int

func initialize(stats : StatSheet):
	level = stats.level
	max_health = stats.max_health
	damage = stats.damage
	speed = stats.speed
	health = max_health

func take_damage(hit):
	health -= hit.damage
	health = max(0, health)

func heal(amount):
	health += amount
	health = max(health, max_health)
	
