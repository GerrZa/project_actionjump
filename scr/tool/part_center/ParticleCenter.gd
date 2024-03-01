#PARTICLE CENTER FOR FAST AND EASY PARTICLE GENERATION
extends Node

###NOTE###
#PARTICLE RESOLUTION MUST BE EVEN NUMBER BOTH WIDTH AND HEIGHT
var test_part = preload("res://asset/ptt/free_fire.png")
var empty_shoot_part = preload("res://asset/ptt/empty_fire.png")

var part_ref = {#TEXTURE, H_FRAME, V_FRAME, FRAME COUNT, FRAME_GAP
	"test" : {"tex":test_part, "hf":3,"vf":4,"framecount":12,"fg":0.1},
	"empty_shoot_test" : {"tex":empty_shoot_part, "hf":7,"vf":1,"framecount":7,"fg":0.02}
}

func spawn_part(part_name: String,pos:Vector2,custom_offset:=Vector2.ZERO,center:=true,look:=false,look_pos:=Vector2.ZERO):
	if !part_ref.has(part_name):
		print("NO PART DATA!")
		return
	
	var ref = part_ref[part_name]
	
	var spr = CustomParticle.new()
	
	spr.texture = ref["tex"]
	spr.hframes = ref["hf"]
	spr.vframes = ref["vf"]
	spr.frame_count = ref["framecount"]
	spr.framp_gap = ref["fg"]
	
	spr.centered = center
	spr.offset = custom_offset
	
	spr.global_position = pos
	
	if look:
		spr.look_at(look_pos)
	
	get_tree().current_scene.add_child(spr)
