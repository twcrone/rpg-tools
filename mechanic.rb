def calculate(good, bad)  
  total = good + bad
  result = rand(total) + 1
  if result <= good
    strength = result / (good + bad) 	
  else
    strength = (result - good) / (bad + good) * -1
  end
  return strength
end

good = ARGV[0].to_f
bad = ARGV[1].to_f
crits = 0
crits2 = 0
crits3 = 0
crits4 = 0
crits5 = 0
runs = 10000
fails = 0

runs.times do
  strength = calculate(good, bad)
  if strength <= 0
    fails += 1 	
  elsif strength > 0 && strength < 0.01
    crits += 1
  elsif strength < 0.04
    crits2 += 1
  elsif strength < 0.12
    crits3 += 1
  elsif strength < 0.25
    crits4 += 1
  else
    crits5 += 1
  end
end

fruns = runs.to_f

puts "**********************************"
puts "Crits=#{crits/fruns}"
puts "Crits2=#{crits2/fruns}"
puts "Crits3=#{crits3/fruns}"
puts "Crits4=#{crits4/fruns}"
puts "Crits5=#{crits5/fruns}"
puts "Successes=#{runs - fails}"
