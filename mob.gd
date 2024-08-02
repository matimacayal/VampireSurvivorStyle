extends CharacterBody2D

@onready var player = $/root/Game/Player
var speed = 300
var health = 3

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	health -= 1
	
	if health <= 0:
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
