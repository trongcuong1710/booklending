class LoginModel 
	include ActiveModel::Model
	include Virtus.model

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	attribute :email, String
	attribute :password, String

	validates :email, presence: true, length: { maximum: 100}, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true, length: { minimum: 8 }
end