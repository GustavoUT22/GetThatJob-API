class Follow < ApplicationRecord
  belongs_to :professional
  belongs_to :followable, polymorphic: true
end
