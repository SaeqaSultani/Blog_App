require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'saeqa', posts_counter: 30, photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be present' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be integer' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'posts counter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Should return n posts after creating n posts' do
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my first post')
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my second post')
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my first post')
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my second post')
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my first post')
    expect(subject.posts_counter).to eq 30
  end

  it 'Should return 0 posts' do
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my first post')
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my second post')
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my first post')
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my second post')
    Post.create(author_id: subject, title: 'Hello Saeqa', text: 'This is my first post')
    expect(subject.recent_posts.length).to eq 0
  end
end
