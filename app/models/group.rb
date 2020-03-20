class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :tasks
  validates :name, presence: true, uniqueness: true
  
  def show_last_task
    if (last_task = tasks.last).present?
      if last_task.content?
        last_task.content
      else  
        'まだやることはありません。'
      end  
    end  
  end
end
