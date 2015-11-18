# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# index = 0
# while index < 25 
# 	project = Project.create name: "IronHack #{index}" , description: "Project #{index} description"
# 	index = index + 1

# 	project.entries.create(hours: 0, minutes: 30)
# end



(1..25).each do |index|
	Project.create(
		name: "IronHack #{index}",
		description: "Project Description #{index}"
		)
end

(1..50).each do |index|
	project = Project.new
	random = Random.new
	Entry.create(
		project_id: random.rand(25),
		hours: random.rand(1),
		minutes: random.rand(60),
		comments: "Comment #{index}",
		date: Date.current)
end