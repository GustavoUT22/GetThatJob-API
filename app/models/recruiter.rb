class Recruiter < ApplicationRecord
  #Associations
  has_many :jobs, counter_cache: true
  has_many :follows, counter_cache: true
  has_one_attached :logo
  #Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :company_name, presence: true, uniqueness: true
  validates :company_about, length: { maximum: 200 }
  validates :password, presence: true

  # validates :company_website,
end
