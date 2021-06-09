class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
 
  before_validation { email.downcase! }
  validates :email, uniqueness: true
  validates :name, presence: true, length: { maximum: 30 } 
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  private

  def admin_limit
    user = User.find(id)
    admin_users = User.where(admin: true)
    if user[:admin] != true
    elsif admin_users.size == 1  || user[:id] == current_user[:id]
      throw(:abort)
    end
  end
end
