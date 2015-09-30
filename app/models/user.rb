class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :timeoutable,
         :omniauthable, :confirmable

  attr_accessor :oauth

  has_many :authentications, inverse_of: :owner, foreign_key: :owner_id
  has_many :members, class_name: "Member", inverse_of: :user
  has_many :communities, through: :members

  def password_required?
    !oauth
  end

  def email_required?
    !oauth
  end

  after_create :subscribe_to_weekly_newsletter

  private

  def subscribe_to_weekly_newsletter
    SubscribeJob.perform_later(self)
  end
end
