class Task < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  validates :content, presence: true
end

# length: {maximum: 12 }
