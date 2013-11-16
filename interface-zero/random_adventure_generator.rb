def pick_one_from(list)
	roll = rand(list.count)
	list[roll]
end

CONTRACTORS = ['AI', 'Conglom', 'Fixer', 'Friend/Family', 'Gang', 'Government', 'Happenstance', 'Celebrity', 'NGO', 'Rebels', 'Rumor/News', 'Tycoon']
MISSIONS = ['Escape/Survive', 'Find Someone/Something', 'Harm (or kill) Someone', 'Manage an Operation', 'Prevent Something', 'Protect Someone/Something', 'Recon/Surveillance', 'Rescue Someone', 'Solve Mystery', 'Steal/Destroy Something', 'Transport Something/Someone'] 
LOCATIONS = ['Airport/Rail hub', 'Amusement park', 'Arcology', 'Construction site', 
	'Corporate headquarters', 'Gang territory', 'Home', 'Housing project', 'Industrial plant', 
	'Megamall', 'Police station/jail', 'University/research lab', 'Desert/Wasteland', 'Farming Region', 
	'Free Zone', 'Island', 'Mansion/Resort', 'Military Base', 'Nature Preserve', 'Ocean', 'Polar Region', 
	'Space', 'Swamp/Flooded Region', 'Underground']
MACGUFFINS = ['Cash', 'Data', 'Endangered Species', 'Evidence', 'Key', 'Land', 'Medicine',
	'Person', 'Possession', 'Secret', 'Technology', 'Treasure']
INNOCENTS = ['Activist','AI/Upload', 'Child', 'Clone/Simulacrum', 'Doctor', 'Family/Friend',
	'Media Person', 'Politician/Judge', 'Refugee', 'Scavenger', 'Scientist', 'Witness']
ANTAGONISTS = ['Bounty Hunter/Detective', 'Con Man', 'Impostor', 'Corporate Executive/Tycoon',
	'Corrupt Bureaucrat/Politician', 'Crime Lord', 'Hacker', 'Media Personality',
	'Military Officer/Mercenary', 'Priest/Cult Leader', 'Rebel', 'Rogue AI/Upload', 'Spy'] 
COMPLICATIONS = ['Ally with Enemy', 'Betrayed by Contractor', 'Disaster', 'Diversion', 
	'Dodgy Ally', 'False Flag', 'New Technology', 'Old Enemy', 'Old Friend', 
	'Third Force', 'Time Limit', 'Trap']
CONFLICTS = ['Destruction', 'Economic Harm', 'Environmental Damage', 'Family/Friend',
	'Honor', 'Innocents', 'Justice', 'Loyalty', 'Morality', 'Reputation', 'Truth',
	'Wealth']

contractor = pick_one_from(CONTRACTORS)
mission = pick_one_from(MISSIONS)
sub_mission = pick_one_from(MISSIONS)
location1 = pick_one_from(LOCATIONS)
location2 = pick_one_from(LOCATIONS)
location3 = pick_one_from(LOCATIONS)
macguffin = pick_one_from(MACGUFFINS)
innocent = pick_one_from(INNOCENTS)
antagonist1 = pick_one_from(ANTAGONISTS)
antagonist2 = pick_one_from(ANTAGONISTS)
antagonist3 = pick_one_from(ANTAGONISTS)
complication1 = pick_one_from(COMPLICATIONS)
complication2 = pick_one_from(COMPLICATIONS)
conflict1 = pick_one_from(CONFLICTS)
conflict2 = pick_one_from(CONFLICTS)

puts "Contractor:       #{contractor}"
puts "Mission:          #{mission}"
puts "Sub-Mission:      #{sub_mission}"
puts "Location1:        #{location1}"
puts "Location2:        #{location2}"
puts "Location3:        #{location3}"
puts "Macguffin:        #{macguffin}"
puts "Innocent:         #{innocent}"
puts "Antagonist1:      #{antagonist1}"
puts "Antagonist2:      #{antagonist2}"
puts "Antagonist3:      #{antagonist3}"
puts "Complication1:    #{complication1}"
puts "Complication2:    #{complication2}"
puts "Conflict1:        #{conflict1}"
puts "Conflict2:        #{conflict2}"
