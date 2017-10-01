class ActivationToken < ActiveRecord::Base
  belongs_to :user

  validates :token, presence: true

  before_validation :create_token

  def invalidate
    self.update_attributes(
      redeemed: true,
      redeemed_at: Date.today
    )
  end

  private

  def create_token
    self.token = SecureRandom.urlsafe_base64(12)
  end
end