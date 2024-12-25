extends Node2D
class_name Pipes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# move the pipe
	position.x -= delta * 120.0

# will handle if notifier doesn't fire off
func check_off_screen() -> void:
	if position.x < -500:
		queue_free()


func _on_screen_exited() -> void:
	queue_free()
