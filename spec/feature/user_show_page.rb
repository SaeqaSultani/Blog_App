require 'rails_helper'

RSpec.describe 'UserShows', type: :system do
  subject { User.new(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg', bio: 'Teacher from Poland.') }

  before { subject.save }

  describe 'show page' do
    it "I can see the user's profile picture." do
      expect(page).to have_css("img[src*='#{user.photo}']")

    end
    it "I can see the user's username." do
      visit user_path(subject.id)
      page.has_content?(subject.name)
    end
    it 'I can see the number of posts the user has written.' do
      visit user_path(subject.id)
      page.has_content?(subject.posts_counter)
    end
    it "I can see the user's bio." do
      visit user_path(subject.id)
      page.has_content?(subject.bio)
    end
    it "I can see the user's first 3 posts." do
      Post.create([{ author: subject, title: 'First Post', text: 'My first post' },
                   { author: subject, title: 'Second Post', text: 'My Second post' }, { author: subject, title: 'Third Post', text: 'My Third post' }])
      visit user_path(subject.id)
      page.has_content?(subject.posts)
    end
    it "I can see a button that lets me view all of a user's posts." do
      visit user_path(subject.id)
      page.has_button?('See All Posts')
    end
    it "When I click a user's post, it redirects me to that post's show page." do
      post = Post.create(author: subject, title: 'First Post', text: 'My first post')
      visit user_path(subject.id)
      click_on 'First Post'
      visit user_post_path(subject.id, post.id)
      page.has_content?(post.title)
    end
  end
end
