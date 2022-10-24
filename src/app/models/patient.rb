class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ここから修正!!
  def email
    "a@gmail.com"
  end

  def will_save_change_to_email?
    false
  end
  # ここまで
end
