class Recruiter < ApplicationRecord
  #Associations
  has_many :jobs, counter_cache: true, dependent: :destroy
  has_many :follows, counter_cache: true
  has_one_attached :company_logo
  #Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :company_name, presence: true, uniqueness: true
  validates :company_about, length: { maximum: 200 }
  has_secure_password
  has_secure_token
  # validates :company_website,
  def invalid_token
    update(token: nil)
  end

  def self.authenticate(email, password)
    recruiter = Recruiter.find_by(email:)
    return false unless recruiter&.authenticate(password)

    recruiter.regenerate_token
    recruiter
  end

  # def as_json(options = {})
  #   super(options.merge({ methods: [:company_logo_url] }))
  # end

  # def company_logo_url
  #   company_logo.blob.service_url if company_logo.attached? && company_logo.blob.present?
  # end
  
end
