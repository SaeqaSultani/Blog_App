class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, foreign_key: :post_id, dependent: :destroy
  has_many :comments, foreign_key: :post_id, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :likes_counters, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :posts_counter

  def recent_comments
    comments.order(created_at: :desc).includes(:author).limit(5)
  end

  private

  def posts_counter
    author.increment!(:posts_counter)
  end
end
