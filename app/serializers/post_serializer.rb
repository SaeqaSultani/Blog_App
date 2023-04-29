class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :comments_counter, :likes_counters
  has_many :comments
end
