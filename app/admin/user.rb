ActiveAdmin.register User do
	permit_params :email, :name, :password, :password_confirmation

	member_action :regenerate_activation_tokens, method: :get do
		resource.activation_tokens.select(&:redeemed).each do |token|
			token.destroy!
			resource.activation_tokens << ActivationToken.create
		end

		redirect_to admin_users_path
	end

  index do
    selectable_column
    column :email
    column :name
    column :created_at
		column :valid_activation_tokens
		actions defaults: false do |user|
			item 'View', admin_user_path(user), class: 'member_link view_link'
			item 'Edit', edit_admin_user_path(user), class: 'member_link edit_link'
			item 'Destroy', admin_user_path(id: user.id), data: { confirm: 'Are you sure you want to delete this configuration scheme?'}, method: :delete,  class: 'member_link delete_link'
			if user.valid_activation_tokens < Setting.current_settings.activation_tokens_spawned
				item 'Regenerate activation tokens', regenerate_activation_tokens_admin_user_path(user), class: 'member_link'
			end
		end
  end

  filter :email
  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
	end
end

