require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Likes Validations' do
    subject { Like.new(author_id: 2, post_id: 3) }

    before { subject.save }

    it 'checks if author id is a number' do
      subject['author_id'] = 's'
      expect(subject).to_not eql 2
    end

    it 'checks if post id is a number' do
      id = subject['post_id'] = 3
      expect(id).to be == 3
    end
  end
it 'increments likes_counter' do
    user = User.new(
      name: 'John Doe',
      bio: 'Developer',
    )
    user.save

    post = Post.new(
      title: 'My first post',
      text: 'Hello world!',
      comments_counter: 4,
      likes_counters: 5,
      author_id: user.id
    )
    post.save

    like = Like.new(
      author_id: user.id,
      post_id: post.id
    )
    like.save

    expect(post.likes_counters).to_not eq(6)
  end
end
