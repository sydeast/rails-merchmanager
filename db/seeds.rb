30.times do
    name = Faker::Name.unique.first_name
    email = Faker::Internet.unique.email
    password = "fakersomi"
    User.create(name: name, email: email, password: password)
end

#Adds Albums (Change the number to add more of less.)
15.times do
    title = Faker::Music.album
    release_date = Faker::Date.between(from: '2013-01-23', to: '2020-09-25')
    Album.create(title: title, release_date: release_date)
end

#Adds Artists to the Users and Albums (Change the number to add more of less. )
30.times do
    name = Faker::Kpop.solo
    birth_date = Faker::Date.between(from: '1990-01-23', to: '2000-09-25')
    other_name = Faker::Kpop.iii_groups
    status = "public"
    album_id = rand(5..20)
    user_id = rand(1..4)
    Artist.create(name: name, birth_date: birth_date, other_name: other_name, status: status, album_id: album_id, user_id: user_id)
end

#Adds Photocards to a User and an Artist that user owns (Change the number to add more of less. Set the user_id and artist_id after running the first seeds. You can use rand but not in both spots. The artists and thus photocards must (both) belong to the user.)
# 10.times do
#     title = Faker::Verb.base
#     user_id = 1
#     artist_id = 75
#     status = "public"
#     print_type = "Official"
#     card_type = "Standard"
#     Photocard.create(title: title, user_id: user_id, artist_id: artist_id, status: status, print_type: print_type, card_type: card_type)
# end

# 10.times do
#     title = Faker::Verb.base
#     user_id = 4
#     artist_id = rand(70..71)
#     status = "public"
#     print_type = "Official"
#     card_type = "Standard"
#     Photocard.create(title: title, user_id: user_id, artist_id: artist_id, status: status, print_type: print_type, card_type: card_type)
# end

#Adds Posts to random Users
50.times do
    title = Faker::Quote.most_interesting_man_in_the_world
    content = Faker::Hipster.paragraphs
    user_id = rand(1..30)
    Post.create(title: title, content: content, user_id: user_id)
end

# Adds comments to random Posts by random Users
30.times do
    content = Faker::Quote.famous_last_words
    post_id = rand(1..50)
    user_id = rand(1..30)
    Comment.create(content: content, post_id: post_id, user_id: user_id)
end