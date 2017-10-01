class CreateActivationTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :activation_tokens do |t|
      t.string :token, default: '', null: false
      t.boolean :redeemed, default: false, null: false
      t.datetime :redeemed_at

      t.timestamps
    end
  end
end
