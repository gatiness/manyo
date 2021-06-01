class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length:{ maximum:25} 
  validates :description, presence: true, length:{ maximum:200} 

  enum priority: { '未選択':0, '低':1, '中':2, '高':3 }
  enum status: { '未着手':0, '着手済':1, '完了':2 }
  
  paginates_per 10

  scope :search_name_status, -> (name, status) { where("name LIKE ?", "%#{name}%") && where(status: status)}
  scope :search_name, -> (name) { where("name LIKE ?", "%#{name}%") }
  scope :search_status, -> (status) { where(status: status)}
end



