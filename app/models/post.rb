class Post < ApplicationRecord
  validates :title, presence: true,
                     length: {minimum: 6}
  validates :content, presence: true
end
