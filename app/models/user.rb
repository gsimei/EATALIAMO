class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  # validates :username, presence: true, uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # devise :confirmable, :lockable, :timeoutable, :trackable, :registerable, :recoverable
  # Add the following line:
  # attr_accessor :login

  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login == conditions.delete(:login)
  #     where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   else
  #     where(conditions.to_h).first
  #   end
  # end

  def admin?
    admin
  end
end
