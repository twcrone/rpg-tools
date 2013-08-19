DOOR = 'Door'
DOOR_LEFT = 'Door Left'
DOOR_RIGHT = 'Door Right'
DOOR_AHEAD = 'Door Ahead'

DOOR_LOCATION = {
	DOOR_LEFT:	6,
	DOOR_RIGHT:	6,
	DOOR_AHEAD:	8
}

CONTINUE_STRAIGHT = 'Continue Straight'

SIDE_PASSAGE = {
	'left 90 degrees' => 2,
	'right 90 degrees' => 2,
	'left 45 degrees ahead' => 1,
	'right 90 degrees ahead' => 2,
	'left 45 degrees behind' => 1,
	'right 90 degrees behind' => 1,
	'left curve 45 degrees ahead' => 1,
	'right curve 45 degrees ahead' => 1,
	"passage T's" => 3,
	"passage Y's" => 2,
	'four-way intersection' => 4,
	"passage X's" => 1
}

TURN = {
	'left 90 degrees' => 8,
	'left 45 degrees ahead' => 1,
	'left 45 degrees behind' => 1,
	'right 90 degrees' => 8,
	'right 45 degrees ahead' => 1,
	'right 45 degrees behind' => 1
}

ROOM = 'Room'

ROOM_SIZE = {
	'10x10'	=> 1,
	'20x20'	=> 1,
	'30x30' => 1,
	'40x40' => 1,
	'10x20' => 1,
	'20x30' => 2,
	'20x40' => 1,
	'30x40' => 1,
	'30x50' => 1,
	'40x60' => 1,
	'Unusual' => 1
}

STAIRS = {
	'Down 1 level'=> 5,
	'Down 2 levels'=> 1,
	'Down 3 levels'=> 1,
	'Up 1 levels'=> 1,
	'Up dead end'=> 1,
	'Down dead end'=> 1,
	'Chimney up 1 level'=> 1,
	'Chimney up 2 levels'=> 1,
	'Chimney down 2 levels'=> 1,
	'Trap door down 1 level'=> 1,
	'Trap door down 2 levels'=> 1
}

PERIODIC_CHECK_OPTIONS = {
	CONTINUE_STRAIGHT:	2,
	DOOR: 3,
	SIDE_PASSAGE:	4,
	TURN: 3,
	ROOM: 3,
	STAIRS:	1,
	'Dead End'			=>	1,
	'Trick/Trap'		=>	1,
	'Wandering Monster'	=>	1	
}

BEYOND_DOOR = {
	'Parallel Passage'	=> 4,
	'Passage straight ahead'	=> 4,
	'Passage 45 degrees ahead/behind' 	=> 2,
	ROOM: 8
}

NEXT = {
	DOOR: DOOR_LOCATION,
	DOOR_LEFT: BEYOND_DOOR,
	DOOR_RIGHT: BEYOND_DOOR,
	DOOR_AHEAD: BEYOND_DOOR,
	SIDE_PASSAGE: SIDE_PASSAGE,
	TURN: TURN,
	ROOM: ROOM_SIZE,
	STAIRS: STAIRS
}

def pick_one(options)
	table = Array.new
	options.each do |thing, weight|
		weight.times { table << thing }
	end
	index = rand(table.count)
	return table[index]
end


start = pick_one(PERIODIC_CHECK_OPTIONS)
puts start

next_table = NEXT[start]
if next_table
	next_thing = pick_one(next_table)
end

while next_thing
	puts next_thing
	next_table = NEXT[next_thing]
	if next_table
		next_thing = pick_one(next_table)
	else
		next_thing = nil
	end
end