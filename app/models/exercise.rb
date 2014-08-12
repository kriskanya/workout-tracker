class Exercise < ActiveRecord::Base
  belongs_to :workout

  validates_format_of :name, with:/[a-zA-Z]/, message: "must include letters"
  validates_presence_of :name, :weight, :reps, :sets, :description
end
