class User < ApplicationRecord
  # Include default devise modules
  devise :database_authenticatable,
         :registerable,
				 :validatable
         # :recoverable,
         # :rememberable,
         # :trackable,
				 # :confirmable,
				 # :lockable,
				 # :timeoutable,
				 # :omniauthable

  has_many :activation_tokens

  after_create :spawn_activation_tokens

  scope :recent, ->(n = 5) { order('created_at DESC').take(n) }

	def valid_activation_tokens
		activation_tokens.select { |t| !t.redeemed }.count
	end

	private

	def spawn_activation_tokens
		Setting.current_settings.activation_tokens_spawned.times do
			self.activation_tokens << ActivationToken.create
		end
	end
end
