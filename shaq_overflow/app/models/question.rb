class Question < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :votes, as: :votable
  has_many :voters, through: :votes, source: :user
  validates :user_id, :url, :title, presence: true
end
