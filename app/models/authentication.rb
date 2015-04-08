class Authentication < ActiveRecord::Base

  belongs_to :owner, class_name: 'Member', inverse_of: :authentications, foreign_key: :owner_id

  enum sn: {
    vkontakte: 'vkontakte',
    facebook: 'facebook',
    gplus: 'gplus',
    github: 'github',
    linkedin: 'linkedin'
  }

  validates :token, presence: true, uniqueness: { with: true, scope: [:sn] }

  scope :by_auth, ->(auth)  { sn(auth.provider).uid(auth.uid) }
  scope :sn,      ->(name)  { where sn: name }
  scope :uid,     ->(uid)   { where uid: uid }
  scope :token,   ->(token) { where token: token }

end