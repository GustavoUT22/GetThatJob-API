class Follow < ApplicationRecord
  belongs_to :professional
  belongs_to :followable, polymorphic: true
  # validates :user, uniqueness: { scope: :tweet, message: "and Tweet combination already taken" }
end
