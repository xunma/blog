class Post < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false
  validates :date, presence: true
  belongs_to :user

  def read_time
    word_count = self.content.split.size
    "#{(word_count / 200.0).ceil} min read"
  end

  def brief(text, number)
    text.size > number ? text.first(number - 3) + '...' : text
  end

end
