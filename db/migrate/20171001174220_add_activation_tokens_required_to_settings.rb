class AddActivationTokensRequiredToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :activation_tokens_required, :integer, default: '0'
    rename_column :settings, :user_activation_tokens, :activation_tokens_spawned
  end
end
