require 'rails_helper'

RSpec.describe Post, type: :system do
  user = User.create(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg',
                     bio: 'Teacher from Poland.')

  subject do
    Post.new(author_id: user.id, title: 'First Post', text: 'My first post', comments_counter: 20, likes_counters: 30)
  end
  before { subject.save }

  describe 'index page' do
    it "I can see the user's username." do
      visit user_posts_path(user.id)
      page.has_content?(user.name)
    end

    it "I can see the user's profile picture." do
      expect(page.find('img')['src']).to have_content user.photo
    end

    it 'I can see the number of posts the user has written.' do
      visit user_posts_path(user.id)
      page.has_content?(user.posts_counter)
    end

    it "I can see a post's title." do
      visit user_posts_path(user.id)
      page.has_content?(subject.title)
    end

    it "I can see some of the post's body." do
      visit user_posts_path(user.id)
      page.has_content?(subject.text)
    end

    it 'I can see the first comments on a post.' do
      comment = Comment.create(author_id: user.id, post_id: subject.id, text: 'Nice post')
      visit user_posts_path(user.id)
      page.has_content?(comment.text)
    end

    it 'I can see how many comments a post has.' do
      visit user_posts_path(user.id)
      page.has_content?(subject.comments_counter)
    end

    it 'I can see how many likes a post has.' do
      visit user_posts_path(user.id)
      page.has_content?(subject.likes_counters)
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      visit user_posts_path(user.id)
      page.has_button?('Pagination')
    end

    it "When I click on a post, it redirects me to that post's show page." do
      find("a[href='/users/#{user.id}/posts/#{subject.id}']").click
      sleep 1
      expect(current_path).to eq user_post_path(user, subject)
    end
  end
end
