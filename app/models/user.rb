class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :questions
  has_many :answers
  has_many :likes

  def to_s
    email
  end

  def question_owner?(question)
    self == question.user
  end

  def add_points(number)
    self.points += number
    self.save
  end

  def subtract_points(number)
    self.points -= number
    self.save
  end
end
