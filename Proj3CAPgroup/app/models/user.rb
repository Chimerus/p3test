class User < ActiveRecord::Base
	has_many :locations, dependent: :destroy
	has_secure_password
	validates :email, presence: true, uniqueness: {case_sensitive: false}
	before_create {generate_token(:auth_token)}

	def generate_token(column)
		begin
				self[column] = SecureRandom.urlsafe_base64
			end while User.exists?(column => self[column])
	end

end
