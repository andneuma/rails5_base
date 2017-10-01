class AddUserReferenceToActivationTokens < ActiveRecord::Migration[5.1]
  def change
    add_reference :activation_tokens, :user, foreign_key: true
  end
end
