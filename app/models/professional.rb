class Professional < ApplicationRecord
  #Associations
  has_one_attached :resume
  has_many :applications, counter_cache: true
  has_many :follows, counter_cache: true
  #Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true,  format: { with: VALID_EMAIL_REGEX }
  validates :email, presence: true
  # validates :password, presence: true
  has_secure_password
  has_secure_token

  def invalid_token
    update(token: nil)
  end

  def self.authenticate(email, password)
    professional = Professional.find_by(email:)
    return false unless professional&.authenticate(password)

    professional.regenerate_token
    professional
  end

  # def self.valid_login?(email, password)
  #   user = find_by(email: email)
  #   user if user&.authenticate(password)
  # end

end
