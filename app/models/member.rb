class Member < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :lockable, :timeoutable,
         :omniauthable

  attr_accessor :oauth

  has_many :authentications, inverse_of: :owner, foreign_key: :owner_id

  def password_required?
    !oauth
  end

  def email_required?
    !oauth
  end

end
