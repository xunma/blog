class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.mark?(user, post)
    Mark.where(user: user, post: post).any?
  end
end
