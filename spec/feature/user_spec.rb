require 'rails_helper'

RSpec.describe 'UserShows', type: :system do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg',
                          bio: 'Teacher from Poland.')
      @new_user = User.create(name: 'Ali', posts_counter: 20, photo: 'https://randomuser.me/api/portraits/men/80.jpg',
                              bio: 'Teacher from Landan.')
      visit users_path
    end

    it 'I can see the username of all other users.' do
      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'I can see the profile picture for each user.' do
      User.all.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'I can see the number of posts each user has written.' do
      User.all.each do |_user|
        expect(page).to have_content('Number of posts: 0')
      end
    end

    it "When I click on a user, I am redirected to that user's show page." do
      User.delete_all
      user = User.create(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg',
                         bio: 'Teacher from Poland.')
      visit root_path(user)
      click_on 'John'
      visit user_path(user.id)
      page.has_content?('John')
    end
  end
end
