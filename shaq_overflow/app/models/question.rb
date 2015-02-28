class Question < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :votes, as: :votable
  has_many :voters, through: :votes, source: :user
  has_many :answers
  has_many :comments, as: :commentable
  validates :user_id, :url, :title, presence: true


  def reset_all_answers
    self.answers.update_all(accepted:false)
  end

  def best
    self.answers.find_by(accepted: true)
  end

  def elapsed
    Time.now - created_at
  end

  # def self.sort_votes
  #   Question.
  # end

end
