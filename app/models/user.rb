class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:username]
  
  has_one_attached :image

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def admin?
    is_admin
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where("lower(username) = :value OR lower(email) = :value", value: login.downcase).first
    else
      where(conditions.to_h).first
    end
  end
end
