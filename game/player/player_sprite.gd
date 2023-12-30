extends Node2D

var target_pos

func _ready():
	%BodyAnimationPlayer.play("body_idle")
	%EyesAnimationPlayer.play("eyes_blink")
	
func _physics_process(delta):
	%Eyes.position = target_pos

func play_idle_animation():
	%BodyAnimationPlayer.play("body_idle")

func play_walk_animation():
	%BodyAnimationPlayer.play("body_walk")
	
func look_at_target(target):
	if target != null:
		var direction = (target.global_position - global_position).normalized()
		target_pos = direction * 5
	else:
		target_pos = Vector2(0,0)

	
