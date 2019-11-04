class Subject < ApplicationRecord
  belongs_to :tution_class
  has_many :tutionships
  has_many :users, through: :tutionships

  def subject_display
    "#{self.name} - #{self.tution_class.name}"
  end
end
