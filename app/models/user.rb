class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  include ActiveModel::Validations

  validates :name,  presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  field :name, type: String
  field :email, type: String
  field :bio, type: String

  field :password_digest
  has_secure_password

  def self.find_by_login(login)
    if login =~ /@/
      user = find_by(email: login)
    else
      user = find_by(name: login)
    end
   user
  end
end
