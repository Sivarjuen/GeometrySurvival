extends Node2D

const MOB_SCENE = preload("res://game/mobs/mob.tscn")
const BOSS_MOB_SCENE = preload("res://game/mobs/boss_mob.tscn")
const SMOKE_SCENE = preload("res://assets/smoke_explosion/smoke_explosion.tscn")

func _ready():
	# Avoid jitter later on
	var smoke = SMOKE_SCENE.instantiate()
	add_child(smoke)
	smoke.global_position = Vector2(0, 0)

func spawn_mob():
	var new_mob = MOB_SCENE.instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func spawn_boss_mob():
	var new_mob = BOSS_MOB_SCENE.instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true

func _on_boss_mob_timer_timeout():
	spawn_boss_mob()
