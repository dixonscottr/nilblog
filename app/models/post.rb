class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true,
                     length: {minimum: 6}
  validates :content, presence: true
end
