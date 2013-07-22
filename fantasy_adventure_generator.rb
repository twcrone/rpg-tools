MISSIONS = [
	'Rescue Prisoners',
	'Recover Item',
	'Destroy Ancient Evil',
	'Investigate Enemy Outpost'
]

ANTAGONISTS = [
	'Goblinoid',
	'Dragonic',
	'Giant',
	'Undead',
	'Spellcaster',
	'Lycanthrope',
	'Construct',
	'Fey',
	'Human',
	'Underdark',
	'Humanoid'
]

LOCATIONS = [
	'Village',
	'Town',
	'City',
	'Capitol',
	'Forest',
	'Cave',
	'Ruins',
	'Cemetary',
	'Tower',
	'Swamp',
	'Castle',
	'Fort'
]

def pick_one(list)
	index = rand(list.count)
	return list[index]
end

mission = pick_one(MISSIONS)
antagonist = pick_one(ANTAGONISTS)
location = pick_one(LOCATIONS)

puts "Mission    = #{mission}"
puts "Antagonist = #{antagonist}"
puts "Location   = #{location}"