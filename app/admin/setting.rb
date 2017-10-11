ActiveAdmin.register Setting do
	permit_params :app_title, :relay_email_address, :captcha_system

	member_action :activate_settings, method: :get do
		# Deactivate all settings objects
		resource.class.where(active: true).update_all(active: false)

		# Activate selected settings object
		resource.update_attributes(active: true)
		redirect_to admin_settings_path
	end

	index do
		selectable_column
		column 'Schema name', :name
		column :created_at
		actions defaults: false do |settings|
			item 'View', admin_setting_path(settings), class: 'member_link view_link'
			item 'Edit', edit_admin_setting_path(settings), class: 'member_link edit_link'
			item 'Destroy', admin_setting_path(id: settings.id), data: { confirm: 'Are you sure you want to delete this configuration scheme?'}, method: :delete,  class: 'member_link delete_link'
			item 'Activate', activate_settings_admin_setting_path(settings), class: 'member_link activate_link' unless settings.active
		end
	end

	form do |f|
		# CONFIG NAME
		div class: 'settings-name' do
			f.inputs do
				f.input :name
			end
		end

		# ACTION BUTTONS
		f.actions

		# TABS
		div(class: 'tabs') do
			# Tab row
			ul(class: 'nav nav-tabs', role: 'tablist') do
				li { link_to 'Application base', '#app_base' }
				li { link_to 'Users', '#users' }
				li { link_to 'Security', '#security' }
			end

			# Tabs
			div(class: 'tab-content') do
				div(id: 'app_base') do
					f.inputs do
						f.input :app_title
						f.input :app_privacy_policy, as: :text
						f.input :app_imprint, as: :text
					end
				end

				div(id: 'users') do
					f.inputs do
						f.input :user_activation_tokens, as: :number, label: 'Activation tokens per new User'
					end
				end

				div(id: 'security') do
					f.inputs do
						f.input :captcha_system, as: :select, collection: Setting::CAPTCHA_SYSTEMS, label: 'Form protection via captcha'
					end
				end
			end
		end
	end
end
