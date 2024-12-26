extends CharacterBody2D
class_name Tappy


const GRAVITY: float = 1000.0
const POWER: float = -350.0

@onready var anim_sprite: AnimatedSprite2D = $AnimSprite
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $Sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(0, POWER)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	# makes the plane fall
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor() == true:
		die()
	
func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		anim_player.play("power")
	
		
func die() -> void:
	anim_sprite.stop()
	sound.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()
		
		
		
