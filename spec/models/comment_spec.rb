require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment Model Validations' do
    subject { Comment.new(text: 'New Comment', author_id: 1, post_id: 1) }

    before { subject.save }

    it 'checks if title is valid' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'checks if author id is a number' do
      subject['author_id'] = 'ddd'
      expect(subject).to_not be_valid
    end

    it 'checks if post id is a number' do
      id = subject['post_id'] = 1
      expect(id).to be == 1
    end
  end
end
