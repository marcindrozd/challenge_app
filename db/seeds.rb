# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


alice = User.create(email: "alice@example.com", password: "password")
bob = User.create(email: "bob@example.com", password: "password")
charlie = User.create(email: "charlie@example.com", password: "password")

question1 = Question.create(title: "What is your quest?", contents: "What is your quest?", user: alice)
question2 = Question.create(title: "What is your favorite color?", contents: "Please tell me your favorite colors", user: alice)
question3 = Question.create(title: "Who is the best superhero?", contents: "What are your thoughts on this? Who do you like?", user: bob)

answer1 = Answer.create(contents: "To search for Holy Grail!", user: charlie, question: question1)
answer2 = Answer.create(contents: "To search for Holy Grail!", user: bob, question: question1)
answer3 = Answer.create(contents: "Mine is red", user: charlie, question: question2)
answer4 = Answer.create(contents: "Black is the only answer!", user: bob, question: question2)
answer5 = Answer.create(contents: "Iron Man is the greatest!", user: alice, question: question3)
answer6 = Answer.create(contents: "I agree with Alice!", user: charlie, question: question3)
