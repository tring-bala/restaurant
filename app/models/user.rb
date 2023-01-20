class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    user_type === AppConstant::ADMIN
  end

  def restaurant?
    user_type === AppConstant::RESTAURANT
  end

  def user?
    !admin? && !restaurant
  end

  def first_name?
    "#{first_name}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
