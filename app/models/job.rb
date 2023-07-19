class Job < ApplicationRecord
  #Associations
  belongs_to :recruiter
  has_many :applications, counter_cache: true
  has_many :follows, as: :followable, dependent: :destroy
  #Validations
  validates :title, presence: true
  validates :category, presence: true
  validates :type, presence: true
  validates :salary, presence: true, numericality: { greater_than: 0}
  validates :mandatory, presence: true
  validates :optional_req, optional: true
  validates :about, presence: true
end
