module SettingsHelpers
  extend ActiveSupport::Concern
  attr_accessor :model

  included do
    helper_method :expects_activation_tokens
  end

  def expects_activation_tokens
		Setting.current_settings.activation_tokens_required > 0
  end
end
