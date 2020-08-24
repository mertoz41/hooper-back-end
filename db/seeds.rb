# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
User.destroy_all
Feedback.destroy_all
Posting.destroy_all
Comment.destroy_all


Location.create(name: "Clermont Elementary School", latitude: "38.794085297314965", longitude: "-77.11094741259714")
Location.create(name: "Takoma-Pinery Branch Local Park", latitude: "38.984155", longitude: "-77.010081")
Location.create(name: "Jennie Dean Park", latitude: "38.84369569841609", longitude: "-77.08801890333082")
Location.create(name: "Garfield Elementary School", latitude: "38.777377310251204", longitude: "-77.19108981228109")
Location.create(name: "Potomac Yards Court", latitude: "38.82354876767145", longitude: "-77.04785947560642")
Location.create(name: "YMCA & Simpson Park", latitude: "38.82124971988854", longitude: "-77.05274837470728")
Location.create(name: "Volta Park", latitude: "38.9102", longitude: "-77.0671")






