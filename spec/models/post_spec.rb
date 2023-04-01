require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'My First Post', comments_counter: 4, likes_counters: 20) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'likes counter should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be to long' do
    subject.title = 'a' * 256
    expect(subject).to_not be_valid
  end

  it 'comments counter should be integer' do
    subject.comments_counter = 'b'
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be integer' do
    subject.likes_counters = 'c'
    expect(subject).to_not be_valid
  end

  it 'likes counter should be greater than or equal to zero' do
    subject.likes_counters = -2
    expect(subject).to_not be_valid
  end
  
  describe 'update_post_counter' do
    it 'increments the author posts_counter by 1' do
      user = User.create(name: 'User 1', posts_counter: 0)
      Post.create(title: 'Post 1', author_id: user, comments_counter: 0, likes_counters: 0)
      expect(user.posts_counter).to eq(0)
    end
  end
  
  it 'Should return 0 posts' do
    Comment.create(post_id: subject, text: 'This is my first comment')
    Comment.create(post_id: subject, text: 'This is my second comment')
    Comment.create(post_id: subject, text: 'This is my thired comment')
    Comment.create(post_id: subject, text: 'This is my forth comment')
    expect(subject.recent_comments.length).to eq 0
  end

end
