class_name Neverclear
extends Node2D

var _subviewport := SubViewport.new()
var _subviewport_container := SubViewportContainer.new()

func _init() -> void:
	_subviewport_container.anchors_preset = Control.LayoutPreset.PRESET_FULL_RECT
	_subviewport_container.add_child(_subviewport)
	_subviewport.set_clear_mode(SubViewport.CLEAR_MODE_NEVER)

	# Connect via signal so user can define _ready without calling super.
	ready.connect(func():
		get_window().get_viewport().size_changed.connect(_window_size_changed)
		_window_size_changed()

		get_parent().add_child.call_deferred(_subviewport_container)
		reparent.call_deferred(_subviewport)

		RenderingServer.frame_post_draw.connect(queue_redraw)
	)

func _window_size_changed() -> void:
	_subviewport.size = get_window().get_viewport().get_size()
