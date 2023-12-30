extends Area2D

const BULLET = preload("res://game/weapons/bullet.tscn")
var target = null

func _physics_process(delta):
	var angle = rotation_degrees
	if rotation_degrees > 360:
		angle = fmod(rotation_degrees,360)
	elif rotation_degrees < -360:
		angle = fmod(rotation_degrees,-360)
	if (angle >= -90 && angle <= 90) || angle >= 270 || angle <= -270:
		%Pistol.scale.y = 1
	else:
		%Pistol.scale.y = -1
	select_target()

func shoot():
	if target:
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = %ShootingPoint.global_position
		new_bullet.global_rotation = %ShootingPoint.global_rotation
		%ShootingPoint.add_child(new_bullet)

func _on_timer_timeout():
	shoot()

func select_target():
	var closest_distance = 1000
	var closest_enemy = null

	for enemy in get_overlapping_bodies():
		var distance = global_position.distance_to(enemy.global_position)
		if distance < closest_distance:
			closest_distance = distance
			closest_enemy = enemy
	
	target = closest_enemy
	if closest_enemy:
		look_at(target.global_position)


	
