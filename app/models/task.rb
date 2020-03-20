class Task < ApplicationRecord
  
  belongs_to :group
  belongs_to :user
  include RankedModel
  ranks :row_order
  validates :content, presence: true
end

# length: {maximum: 12 }
