# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'



def parse_csv_and_create(file)

csv_text = File.read(Rails.root.join('lib', 'seeds', file))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  State.create(name: row['State'], capital: row['Capital'], region: row['Region'], guess: "",
    correct_answer: false)
end

end

 parse_csv_and_create('africa.csv')
 parse_csv_and_create('asia.csv')
 parse_csv_and_create('canada.csv')
 parse_csv_and_create('central_america.csv')
 parse_csv_and_create('europe.csv')
 parse_csv_and_create('oceania.csv')
 parse_csv_and_create('south_america.csv')
 parse_csv_and_create('us-capitals.csv')



