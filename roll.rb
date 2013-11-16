ARGV.each do |sides|
  roll = rand(sides.to_i)
  puts "#{roll} on #{sides}"
end
