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

class SavageCharacter
	attr_accessor :name, :description, :attributes, :secondary_attributes, :hindrances,
	:edges, :skills

	def initialize(name)
		@name = name
		@description = 'Savage Character'
		@attributes = SavageAttributes.new()
		@secondary_attributes = SecondarySavageAttributes.new()
		@hindrances = []
		@edges = []
		@skills = []
	end
end

#pal = SavageCharacter.new('Pal')
#YAML::dump("#{pal.name}.yaml")
pal = YAML::load_file('pal.yaml')
attrs = pal.attributes

YAML::dump(pal)

file = File.new("#{pal.name}.html", 'w')

file.puts <<-eos
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family:'courier';
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
</style>
</head>
<body>
	<h1>#{pal.name}</h1>
	<h2>#{pal.description}</h2>

	<h3>Attributes</h3>
	<table class='attribute-table'>
		<tr>
			<td class='attribute-panel'>

				<table class='attribute-row'>
					<tr>
						<td class='attribute-cell'>Agility</td>
						<td class='attribute-value-cell'>#{attrs.agility}</td>
					</tr>
					<tr>
						<td class='attribute-cell'>Smarts</td>
						<td class='attribute-value-cell'>#{attrs.smarts}</td>
					</tr>
					<tr>
						<td class='attribute-cell'>Spirit</td>
						<td class='attribute-value-cell'>#{attrs.spirit}</td>
					<tr>
					<tr class='attribute-row'>
						<td class='attribute-cell'>Strength</td>
						<td class='attribute-value-cell'>#{attrs.strength}</td>
					</tr>
					<tr>
						<td class='attribute-cell'>Vigor</td>
						<td class='attribute-value-cell'>#{attrs.vigor}</td>
					</tr>
				</table>

			</td>
			<td class='attribute-panel'>

				<table class='attribute-row'>
					<tr>
						<td class='attribute-cell'>Charisma</td>
						<td class='attribute-value-cell'>#{pal.secondary_attributes.charisma}</td>
					</tr>
					<tr>
						<td class='attribute-cell'>Pace</td>
						<td class='attribute-value-cell'>#{pal.secondary_attributes.pace}</td>
					</tr>
					<tr>
						<td class='attribute-cell'>Parry</td>
						<td class='attribute-value-cell'>#{pal.secondary_attributes.parry}</td>
					<tr>
					<tr class='attribute-row'>
						<td class='attribute-cell'>Toughness</td>
						<td class='attribute-value-cell'>#{pal.secondary_attributes.toughness}</td>
					</tr>
					<tr>
						<td class='attribute-cell'>Rank (XP)</td>
						<td class='attribute-value-cell'>#{pal.secondary_attributes.rank}</td>
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

pal.hindrances.each do | hindrance |
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

pal.edges.each do | edge |
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

pal.skills.each do | skill |
	file.puts <<-eos
					<tr>
						<td class='attribute-cell'>
							#{skill.name}
						</td>
						<td class='attribute-value-cell'>
							#{skill.score}
						</td>
					</tr>
	eos

end

file.puts <<-eos					
				</table>

			</td>
		</tr>	
	</table>

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
		<tr>
			<td class="augmentation-name-cell">
				Reflex Enhancers
			</td>
			<td class="augmentation-level-cell">
				Streetware
			</td>
			<td class="augmentation-effects-cell">
				+1 Parry
			</td>
			<td class="augmentation-strain-cell">
				2
			</td>
		</tr>
		<tr>
			<td class="augmentation-name-cell">
				Muscle Augmentation
			</td>
			<td class="augmentation-level-cell">
				Streetware
			</td>
			<td class="augmentation-effects-cell">
				Increase Strength one step
			</td>
			<td class="augmentation-strain-cell">
				2
			</td>
		</tr>
		<tr>
			<td class="augmentation-name-cell">
			</td>
			<td class="augmentation-level-cell">
			</td>
			<td class="augmentation-strain-total-label-cell">
				Total
			</td>
			<td class="augmentation-strain-cell">
				4
			</td>
		</tr>
	</table>

</body>
</html>
eos

file.close
system "open #{file.path}"
puts YAML::dump(pal)