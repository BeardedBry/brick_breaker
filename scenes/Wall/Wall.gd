extends StaticBody2D
class_name Wall

enum WallType {
	TOP,
	SIDE,
	BOTTOM
}

export(WallType) var wall_type = WallType.SIDE
