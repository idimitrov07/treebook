# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DEFAULT_INSECURE_PASSWORD = "mikethefrog1"

User.create({
	first_name: "Mike",
	last_name: "The Frog",
	profile_name: "mikethefrog",
	email: "mike@teamtreehouse.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
	})

User.create({
	first_name: "Jason",
	last_name: "Seifer",
	profile_name: "jason",
	email: "jason@teamtreehouse.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
	})

User.create({
	first_name: "Jim",
	last_name: "Hawskins",
	profile_name: "Jim",
	email: "jim@teamtreehouse.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
	})
User.create({
	first_name: "Nick",
	last_name: "Pettit",
	profile_name: "nick",
	email: "nick@teamtreehouse.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
	})

User.create({
	first_name: "Ryan",
	last_name: "Carson",
	profile_name: "ryan",
	email: "ryan@teamtreehouse.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
	})

User.create({
	first_name: "Ivan",
	last_name: "Dim",
	profile_name: "ivan",
	email: "idimitrov07@gmail.com",
	password: DEFAULT_INSECURE_PASSWORD,
	password_confirmation: DEFAULT_INSECURE_PASSWORD
	})

jason = User.find_by_email('jason@teamtreehouse.com')
jim = User.find_by_email('jim@teamtreehouse.com')
nick = User.find_by_email('nick@teamtreehouse.com')
mike = User.find_by_email('mike@teamtreehouse.com')
ryan = User.find_by_email('ryan@teamtreehouse.com')
ivan = User.find_by_email('idimitrov07@gmail.com')

seed_user = jason

seed_user.statuses.create(content: "Hello, people!")
ivan.statuses.create(content: "Heey there!")
jim.statuses.create(content: "Hi, from Jim!")
nick.statuses.create(content: "Whats uup!")
mike.statuses.create(content: "I want to learn HTML and javapress")
ryan.statuses.create(content: "Treebook rocks!")

UserFriendship.request(seed_user, jim).accept!
UserFriendship.request(seed_user, nick).block!
UserFriendship.request(seed_user, mike)
UserFriendship.request(ryan, seed_user)
UserFriendship.request(seed_user, ivan).accept!