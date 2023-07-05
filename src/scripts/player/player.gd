class_name Player
extends CharacterBody2D

@export var controls : PlayerControls
@export var sprite : Sprite2D
@export var animation_tree : AnimationTree

var motion : Vector2 = Vector2.ZERO
var speed : int

func _ready():
	if animation_tree:
		animation_tree.active = true

func handle_input():
	motion.x = Input.get_axis(controls.move_left, controls.move_right)
	motion.y = Input.get_axis(controls.move_up, controls.move_down)
	motion = motion.normalized()
	
	velocity = motion * speed

## Updates the sprite scale to reflect the character's motion.
func flip_sprite():
	var sprite_scale = sprite.scale.x
	if motion.x > 0:
		sprite_scale = lerp(sprite_scale, 1.0, 0.25)
	elif motion.x < 0:
		sprite_scale = lerp(sprite_scale, -1.0, 0.25)
	else:
		sprite_scale = lerp(sprite_scale, sign(sprite_scale), 0.25)
		
	sprite.scale.x = sprite_scale

func update_animation():
	if animation_tree:
		print_debug(animation_tree["parameters/conditions/is_idle"])
		if motion == Vector2.ZERO:
			animation_tree["parameters/conditions/is_idle"] = true
			animation_tree["parameters/conditions/is_walking"] = false
		else:
			animation_tree["parameters/conditions/is_idle"] = false
			animation_tree["parameters/conditions/is_walking"] = true

func _physics_process(_delta):
	handle_input()
	flip_sprite()
	update_animation()
	move_and_slide()
