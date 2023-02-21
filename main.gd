extends Neverclear

func _draw() -> void:
	var viewport_rect := get_viewport_rect()
	draw_circle(
		Vector2(randf_range(0, viewport_rect.end.x), randf_range(0, viewport_rect.end.y)),
		randi_range(5, 150),
		Color.ORANGE_RED.lerp(Color.MEDIUM_SPRING_GREEN, randf_range(0, 1))
	)

