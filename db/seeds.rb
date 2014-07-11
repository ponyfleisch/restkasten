# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Access.delete_all
Purchase.delete_all
AccessObject.delete_all
User.delete_all

users = User.create([{name: 'bert', password: 'yolo', admin: true, rfid: 10425129}, {name: 'claudio', password: 'yolo', admin: true, rfid: 54321}])

access_objects = AccessObject.create([{name: 'WC', users: users}, {name: 'Haupteingang', users: [users.first]}, {name: 'Fraese', users: [users.last]}])

