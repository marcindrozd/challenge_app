class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates_presence_of :title

  def has_accepted_answer?
    if !check_accepted.empty?
      true
    else
      false
    end
  end

  def check_accepted
    answers.all.select { |a| a.accepted == true }
  end
end
