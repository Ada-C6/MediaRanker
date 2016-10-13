# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open("#{Rails.root}/spec/fixtures/users.yml", 'w') do |file|
  data = User.all.to_a.map(&:attributes)
  data.each{|x| x.delete('id')}
  file.write data.to_yaml
end
