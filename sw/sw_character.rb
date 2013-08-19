require "yaml"

class SavageAttributes
	attr_accessor :agility, :smarts, :spirit, :strength, :vigor
	def initialize()
		@agility = 'd4'
		@smarts = 'd4'
		@spirit = 'd4'
		@strength = 'd4'
		@vigor = 'd4'
	end
end

class SecondarySavageAttributes
	attr_accessor :charisma, :pace, :parry, :toughness, :rank
	def initialize()
		@charisma = 0
		@pace = 6
		@parry = 6
		@toughness = "5"
		@rank = "Novice (3)"
	end
end

class Trait
	attr_accessor :name, :type, :description
	def initialize()
		@name = 'Hindrance'
		@type = 'Major'
		@description = 'Description'
	end
end

class Skill
	attr_accessor :name, :score
	def initialize()
		@name = 'Skill'
		@score = 'd4'
	end
end

class Augmentation
	attr_accessor :name, :category, :effect, :strain

	def initialize()
		@name = "Augmentation"
		@category = "Streetware"
		@effect = "Effect"
		@strain = 0
	end

end

class Power

	attr_accessor :name, :power_points, :range, :duration, :trapping, :description

	def initialize()
		@name = "Power"
		@power_points = 0
		@range = 'Smarts'
		@duration = 'Instant'
		@trapping = 'Invisible'
		@description = 'TBD'
	end
end

class SavageCharacter
	attr_accessor :name, :description, :attributes, :secondary_attributes, :hindrances,
	:edges, :skills, :augmentations, :powers

	def initialize(name)
		@name = name
		@description = 'Savage Character'
		@attributes = SavageAttributes.new()
		@secondary_attributes = SecondarySavageAttributes.new()
		@hindrances = []
		@edges = []
		@skills = []
		@augmentations = []
		@powers = []
	end

	def total_strain()
		total = 0
		augmentations.each do | augmentation |
			total += augmentation.strain
		end
		return total
	end
end

name = ARGV[0]
character = YAML::load_file("#{name}.yaml")
attrs = character.attributes

YAML::dump(character)

file = File.new("#{character.name}.html", 'w')

file.puts <<-eos
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family:'courier';
}
h3 {
	border-bottom: 1px dotted black;
}
.attribute-panel {
	width: 50%;
	vertical-align: top;
}
.attribute-cell {
	width: 40%;
}
.attribute-value-cell {
	width: 60%;
	font-weight: bold;
}
.d4 {
	color: blue
}
.d6 {
	color: green
}
.d8 {
	color: yellow
}
.d10 {
	color: orange
}
.d12 {
	color: red
}
.edge-cell {
	width: 40%;
	font-weight: bold;
	vertical-align: top;
}
.edge-description-cell {
	width: 60%;
}
.attribute-row {
	width: 100%;
}
.attribute-table {
	width: 100%;
}
.augmentation-name-cell {
	width:25%;
	vertical-align:top;
	font-weight:bold;
}
.augmentation-level-cell {
	width:20%;
	vertical-align:top;
}
.augmentation-effects-cell {
	width:45%;
	vertical-align:top;
}
.augmentation-strain-cell {
	width:10%;
	vertical-align:top;
	text-align:center;
}
.table-header {
	font-weight: bold;
}
.augmentation-strain-total-label-cell {
	width: 45%;
	vertical-align: top;
	text-align: right;
	font-weight: bold;
}
.power-name-cell {
	width: 20%;
	vertical-align: top;
	text-align: left;
	font-weight: bold;
}
.power-points-cell {
	width: 5%;
	vertical-align: top;
	text-align: center;
}
.power-range-cell {
	width: 20%;
	vertical-align: top;
	text-align: center;
}
.power-duration-cell {
	width: 10%;
	vertical-align: center;
	text-align: left;
}
.power-description-cell {
	width: 45%;
	vertical-align: top;
	text-align: left;
}


</style>
</head>
<body>
	<h1>#{character.name}</h1>
	<h2>#{character.description}</h2>

	<h3>Attributes</h3>
	<table class='attribute-table'>
		<tr>
			<td class='attribute-panel'>

				<table class='attribute-row'>
					<tr>
						<td class='attribute-cell'>Agility</td>
						<td class='attribute-value-cell'><div class='#{attrs.agility}'>#{attrs.agility}</div></td>
					</tr>
					<tr>
						<td class='attribute-cell'>Smarts</td>
						<td class='attribute-value-cell'><div class='#{attrs.smarts}'>#{attrs.smarts}</div></td>
					</tr>
					<tr>
						<td class='attribute-cell'>Spirit</td>
						<td class='attribute-value-cell'><div class='#{attrs.spirit}'>#{attrs.spirit}</div></td>
					<tr>
					<tr class='attribute-row'>
						<td class='attribute-cell'>Strength</td>
						<td class='attribute-value-cell'><div class='#{attrs.strength}'>#{attrs.strength}</div></td>
					</tr>
					<tr>
						<td class='attribute-cell'>Vigor</td>
						<td class='attribute-value-cell'><div class='#{attrs.vigor}'>#{attrs.vigor}</div></td>
					</tr>
				</table>

			</td>
			<td class='attribute-panel'>

				<table class='attribute-row'>
					<tr>
						<td class='attribute-cell'>Charisma</td>
						<td class='attribute-value-cell'>#{character.secondary_attributes.charisma}</td>
					</tr>
					<tr>
						<td class='attribute-cell'>Pace</td>
						<td class='attribute-value-cell'>#{character.secondary_attributes.pace}</td>
					</tr>
					<tr>
						<td class='attribute-cell'>Parry</td>
						<td class='attribute-value-cell'>#{character.secondary_attributes.parry}</td>
					<tr>
					<tr class='attribute-row'>
						<td class='attribute-cell'>Toughness</td>
						<td class='attribute-value-cell'>#{character.secondary_attributes.toughness}</td>
					</tr>
					<tr>
						<td class='attribute-cell'>Rank (XP)</td>
						<td class='attribute-value-cell'>#{character.secondary_attributes.rank}</td>
					</tr>
				</table>

			</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td class='attribute-panel'>
				<h3>Hindrances</h3>
				<table class='attribute-row'>
eos

character.hindrances.each do | hindrance |
	file.puts <<-eos
					<tr>
						<td>
							#{hindrance.name}
						</td>
					</tr>
	eos

end

file.puts <<-eos
				</table>

				<h3>Edges</h3>
				<table class='attribute-row'>
eos

character.edges.each do | edge |
	file.puts <<-eos
					<tr>
						<td class='edge-cell'>
							#{edge.name}
						</td>
						<td class='edge-description-cell'>
							#{edge.description}
						</td>
					</tr>
	eos

end

file.puts <<-eos
				</table>

			</td>

			<td class='attribute-panel'>

				<h3>Skills</h3>
				<table class='attribute-row'>
eos

character.skills.each do | skill |
	file.puts <<-eos
					<tr>
						<td class='attribute-cell'>
							#{skill.name}
						</td>
						<td class='attribute-value-cell'>
							<div class='#{skill.score}'>#{skill.score}</div>
						</td>
					</tr>
	eos

end

file.puts <<-eos					
				</table>

			</td>
		</tr>	
	</table>
eos

if character.augmentations != nil

file.puts <<-eos	
	<h3>Augmentations</h3>
	<table style="width:100%">
		<tr>
			<td class="augmentation-name-cell">
			</td>
			<td class="augmentation-level-cell table-header">
				Level
			</td>
			<td class="augmentation-effects-cell table-header">
				Effects
			</td>
			<td class="augmentation-strain-cell table-header">
				Strain
			</td>
		</tr>
eos

character.augmentations.each do | augmentation |
	file.puts <<-eos
		<tr>
			<td class="augmentation-name-cell">
				#{augmentation.name}
			</td>
			<td class="augmentation-level-cell">
				#{augmentation.category}
			</td>
			<td class="augmentation-effects-cell">
				#{augmentation.effect}
			</td>
			<td class="augmentation-strain-cell">
				#{augmentation.strain}
			</td>
		</tr>
	eos

end

file.puts <<-eos
		<tr>
			<td class="augmentation-name-cell">
			</td>
			<td class="augmentation-level-cell">
			</td>
			<td class="augmentation-strain-total-label-cell">
				Total
			</td>
			<td class="augmentation-strain-cell">
				#{character.total_strain}
			</td>
		</tr>
	</table>
eos
end

if character.powers != nil

file.puts <<-eos	
	<h3>Powers</h3>
	<table style="width:100%">
		<tr>
			<td class="power-name-cell">
			</td>
			<td class="power-points-cell table-header">
				Points
			</td>
			<td class="power-range-cell table-header">
				Range
			</td>
			<td class="power-duration-cell table-header">
				Duration
			</td>
			<td class="power-description-cell table-header">
				Description
			</td>
		</tr>
eos

character.powers.each do | power |
	file.puts <<-eos
		<tr>
			<td class="power-name-cell">
				#{power.name}
			</td>
			<td class="power-points-cell">
				#{power.power_points}
			</td>
			<td class="power-range-cell">
				#{power.range}
			</td>
			<td class="power-duration-cell">
				#{power.duration}
			</td>
			<td class="power-description-cell">
				#{power.description}
			</td>
		</tr>
	eos

end

end

<<-eos
</body>
</html>
eos

file.close
system "open #{file.path}"
puts YAML::dump(character)