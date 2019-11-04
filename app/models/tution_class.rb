class TutionClass < ApplicationRecord
  has_many :subjects

  enum level: %i[school college university]
end
