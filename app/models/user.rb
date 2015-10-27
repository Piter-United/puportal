class User < ActiveRecord::Base
  include PgSearch

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :timeoutable,
         :omniauthable, :confirmable

  attr_accessor :oauth

  has_many :authentications, inverse_of: :owner, foreign_key: :owner_id
  has_many :members, class_name: "Member", inverse_of: :user
  has_many :communities, through: :members

  pg_search_scope :q, using: {
    tsearch: { dictionary: "russian" },
    trigram: { only: [:name, :skills], threshold: 0.285 }
  }, against: {
    name: "A",
    skills: "B"
  }

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
