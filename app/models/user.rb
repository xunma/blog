class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, allow_blank: false
  has_many :posts

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def join_time
    created_at.strftime("%m/%d/%y")
  end

  def posts_number
    n = Post.where(user: self).count
    "Contributed #{n} blogs "
  end
end
