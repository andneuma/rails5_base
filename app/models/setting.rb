require 'validators/custom_validators'
require 'sanitize'

class Setting < ActiveRecord::Base
  include CustomValidators
  include Sanitization

  scope :current_settings, -> { find_by(active: true) }

  CAPTCHA_SYSTEMS = %w[recaptcha simple_captcha]

  after_validation :sanitize_app_privacy_policy, on: [:create, :update]
  after_validation :sanitize_app_imprint, on: [:create, :update]

	validates :name, length: { minimum: 3, maximum: 30 }
  validates :app_title, length: { maximum: 20 }
  validates :relay_email_address, presence: true
  validates :user_activation_tokens, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :captcha_system, inclusion: { in: CAPTCHA_SYSTEMS }

  ## SANITIZE
  def sanitize_app_imprint
    self.app_imprint = sanitize(app_imprint)
  end

  def sanitize_app_privacy_policy
    self.app_privacy_policy = sanitize(app_privacy_policy)
  end

  def self.all_settings
    self.last.attributes.except("id")
  end

  def self.captcha_systems
		CAPTCHA_SYSTEMS
  end
end
