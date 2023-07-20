class Professional < ApplicationRecord
  #Associations
  has_one_attached :resume
  has_many :applications, counter_cache: true, dependent: :destroy
  has_many :follows, counter_cache: true, dependent: :destroy
  #Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,  format: { with: VALID_EMAIL_REGEX }
  
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
