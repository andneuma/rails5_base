module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "success"
    when "error"
      "danger"
    when "alert"
      "warning"
    when "notice"
      "info"
    else
      flash_type.to_s
    end
  end

  def devise_links
    links = []
    links << link_to("Log in", new_session_path(resource_name)) if controller_name != 'sessions'
    links << link_to("Sign up", new_registration_path(resource_name)) if devise_mapping.registerable? && controller_name != 'registrations'
    links << link_to("Forgot your password?", new_password_path(resource_name)) if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
    links << link_to("Didn't receive confirmation instructions?", new_confirmation_path(resource_name)) if devise_mapping.confirmable? && controller_name != 'confirmations'
    links << link_to("Didn't receive unlock instructions?", new_unlock_path(resource_name)) if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'

    links.join(' | ')
  end
end
