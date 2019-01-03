class Post < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false
  validates :date, presence: true
  belongs_to :user
end
