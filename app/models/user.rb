# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  include DeviseTokenAuth::Concerns::User

  belongs_to :school
  belongs_to :college
  belongs_to :university

  mount_uploader :image, AvatarUploader

  enum sex: %i[male female other]
  enum role: %i[teacher student guardian]

end
