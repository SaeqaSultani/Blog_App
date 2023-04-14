require 'rails_helper'

RSpec.describe Post, type: :system do
  user = User.create(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg',
                     bio: 'Teacher from Poland.')
  user1 = User.create(name: 'Ali', posts_counter: 20, photo: 'https://randomuser.me/api/portraits/men/80.jpg',
                      bio: 'Teacher from Landan.')                   

  subject do
    Post.new(author_id: user.id, title: 'First Post', text: 'My first post', comments_counter: 20, likes_counters: 30)
  end
  before { subject.save }

  describe 'show page' do
    it "I can see a post's title." do
      visit user_post_path(user.id, subject.id)
      page.has_content?(subject.title)
    end

    it 'I can see how many comments a post has.' do
      visit user_post_path(user.id, subject.id)
      page.has_content?(subject.comments_counter)
    end

    it 'I can see how many likes a post has.' do
      visit user_post_path(user.id, subject.id)
      page.has_content?(subject.likes_counters)
    end

    it 'I can see who wrote the post.' do
      visit user_post_path(user.id, subject.id)
      page.has_content?(user.name)
    end

    it "I can see some of the post's body." do
      visit user_post_path(user.id, subject.id)
      page.has_content?(subject.text)
    end

    it 'I can see the username of each commentor.' do
      comment1 = Comment.create(author_id: user.id, post_id: subject.id, text: 'Nice post')
      comment2 = Comment.create(author_id: user1.id, post_id: subject.id, text: 'I like this post')

      visit user_post_path(user.id, subject.id)
      visit user_post_path(user1.id, subject.id)
      page.has_content?(comment1.author.name)
      page.has_content?(comment2.author.name)
    end
    it 'I can see the comment each commentor left.' do
      comment1 = Comment.create(author_id: user.id, post_id: subject.id, text: 'Nice post')
      comment2 = Comment.create(author_id: user1.id, post_id: subject.id, text: 'I like this post')
      visit user_post_path(user.id, subject.id)
      visit user_post_path(user1.id, subject.id)
      page.has_content?(comment1.text)
      page.has_content?(comment2.text)
    end
  end
end
