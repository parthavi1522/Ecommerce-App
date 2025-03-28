class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:username]
  
  has_one_attached :profile

  scope :customers, -> { where(is_admin: false) }

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, :mobile_number, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :mobile_number, presence: true, uniqueness: true,
            format: { with: /\A[6789]\d{9}\z/, message: "must be a valid 10-digit Indian mobile number" }

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

  def full_name
    [first_name, last_name].compact.join(" ")
  end
end
