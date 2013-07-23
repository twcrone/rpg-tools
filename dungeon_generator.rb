PERIODIC_CHECK_OPTIONS = {
	'Continue'			=>	2,
	'Door'				=>	3,
	'Side Passage'		=>	4,
	'Turn'				=>	3,
	'Chamber'			=>	3,
	'Stairs'			=>	1,
	'Dead End'			=>	1,
	'Trick/Trap'		=>	1,
	'Wandering Monster'	=>	1	
}

DOORS = {
	'Left'	=>	6,
	'Right'	=>	6,
	'Ahead'	=>	8
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
if start == 'Door'
	door = pick_one(DOORS)
	puts door
end
