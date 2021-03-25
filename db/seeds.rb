# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
    name = Faker::Name.unique.first_name
    email = Faker::Internet.unique.email
    password = "fakersomi"
    User.create(name: name, email: email, password: password)
end

15.times do
    title = Faker::Music.album
    release_date = Faker::Date.between(from: '2013-01-23', to: '2020-09-25')
    Album.create(title: title, release_date: release_date)
end

50.times do
    name = Faker::Kpop.solo
    birth_date = Faker::Date.between(from: '1990-01-23', to: '2000-09-25')
    other_name = Faker::Kpop.iii_groups
    status = "public"
    album_id = rand(5..20)
    user_id = rand(1..20)
    Artist.create(name: name, birth_date: birth_date, other_name: other_name, status: status, album_id: album_id, user_id: user_id)
end

6.times do
    title = Faker::Verb.base
    user_id = 3
    artist_id = 6
    status = "public"
    print_type = "Official"
    card_type = "Standard"
    Photocard.create(title: title, user_id: user_id, artist_id: artist_id, status: status, print_type: print_type, card_type: card_type)
end

8.times do
    title = Faker::Verb.base
    user_id = 1
    artist_id = 4
    status = "public"
    print_type = "Official"
    card_type = "Standard"
    Photocard.create(title: title, user_id: user_id, artist_id: artist_id, status: status, print_type: print_type, card_type: card_type)
end


20.times do
    title = Faker::Quote.most_interesting_man_in_the_world
    content = Faker::Hipster.paragraphs
    user_id = rand(1..27)
    Post.create(title: title, content: content, user_id: user_id)
end

60.times do
    content = Faker::Quote.famous_last_words
    post_id = rand(1..25)
    user_id = rand(1..27)
    Comment.create(content: content, post_id: post_id, user_id: user_id)
end