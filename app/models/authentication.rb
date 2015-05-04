class Authentication < ActiveRecord::Base
  belongs_to :owner, class_name: "Member", inverse_of: :authentications, foreign_key: :owner_id

  enum provider: {
    vkontakte: "vkontakte",
    facebook: "facebook",
    gplus: "gplus",
    github: "github",
    linkedin: "linkedin"
  }

  validates :token, presence: true, uniqueness: { with: true, scope: [:provider] }

  scope :by_auth, ->(auth){ provider(auth.provider).uid(auth.uid) }
  scope :provider, ->(name){ where provider: name }
  scope :uid, ->(uid){ where uid: uid }
  scope :token, ->(token){ where token: token }
end
