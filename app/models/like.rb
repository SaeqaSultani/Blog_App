class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id
  after_save :like_counters

  private

  def like_counters
    post.increment!(:likes_counters)
  end
end
