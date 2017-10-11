class SettingsController < ApplicationController
	def activate_setting
		# Deactivate all settings objects
		Setting.where(active: true).update_all(active: false)

		# Activate selected settings object
		@current_setting = Setting.find(id: params[:id])
		@current_setting.update_attributes(active: true)
	end

	private

	def settings_params
		params.require(:settings).permit(
				:active
		)
	end
end