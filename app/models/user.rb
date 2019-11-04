# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  include DeviseTokenAuth::Concerns::User

  belongs_to :school, optional: true
  belongs_to :college, optional: true
  belongs_to :university, optional: true
  has_many :tutionships
  has_many :subjects, through: :tutionships
  accepts_nested_attributes_for :tutionships, allow_destroy: true

  validates_presence_of :full_name

  mount_uploader :image, AvatarUploader

  enum sex: %i[male female other]
  enum role: %i[teacher student guardian]

end
