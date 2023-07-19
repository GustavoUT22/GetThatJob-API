class Application < ApplicationRecord
  #Associations
  belongs_to :professional
  belongs_to :job
  has_one_attached :cv
  #validations
  validates :experience, presence: true, length: { minimum: 50 }
  validates :why_interested, presence: true, length: { minimum: 50 }
end
