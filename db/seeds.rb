# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create!(role: 'admin', email: 'tom@gmail.com', password:'123456', name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
   second_user = User.create!(role: 'user', email: 'lillty@gmail.com',  password:'123456', name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 0)
   third_user = User.create!(role: 'user', email: 'mudasir@gmail.com',  password:'123456', name: 'mudasir', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from pakistan.', posts_counter: 0)
   
   first_post = Post.create!(author: first_user, title: 'Post Written by Tom', text: 'This is Tom first post This is Tom first postThis is Tom first postThis is Tom first postThis is Tom first postThis is Tom first postThis is Tom first post' )
   second_post = Post.create!(author: first_user, title: 'Post Written by Tom', text: 'This is Tom second post This is Tom second postThis is Tom second postThis is Tom second postThis is Tom second postThis is Tom second postThis is Tom second postThis is Tom second post')
   third_post = Post.create!(author: second_user, title: 'Post Written by Lilly', text: 'This is Lilly first postThis is Lilly first postThis is Lilly first postThis is Lilly first postThis is Lilly first postThis is Lilly first post')
   fourth_post = Post.create!(author: second_user, title: 'Post Written by Lilly', text: 'This is Lilly second post This is Lilly second postThis is Lilly second postThis is Lilly second postThis is Lilly second postThis is Lilly second post')

   Comment.create!(post: first_post, author: first_user, text: 'Hi Tom! 1 comments' )
   Comment.create!(post: first_post, author: first_user, text: 'Hi Tom! 2 comments' )
   Comment.create!(post: first_post, author: first_user, text: 'Hi Tom! 3 comments' )
   Comment.create!(post: second_post, author: first_user, text: 'Hi Tom! 4 comments' )
   Comment.create!(post: third_post, author: second_user, text: 'Hi Lilly! 1 comments' )
   Comment.create!(post: fourth_post, author: second_user, text: 'Hi Lilly! 2 comments' )
   Comment.create!(post: fourth_post, author: second_user, text: 'Hi Lilly! 3 comments' )