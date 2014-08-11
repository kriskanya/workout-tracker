class Workout < ActiveRecord::Base
  belongs_to :daily_routine
  has_many :exercises

  validates_presence_of :name, :daily_routine
end
