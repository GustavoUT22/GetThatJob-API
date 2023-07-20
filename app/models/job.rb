class Job < ApplicationRecord
  #Associations
  belongs_to :recruiter
  has_many :applications, dependent: :destroy
  has_many :follows, as: :followable, dependent: :destroy
  #Validations
  validates :title, presence: true
  validates :category, presence: true
  validates :job_type, presence: true
  validates :salary, presence: true, numericality: { greater_than: 0}
  validates :mandatory, presence: true
  validates :about, presence: true
end
