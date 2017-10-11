class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.boolean "active",                 default: false,            null: false
      t.string  "name",                   default: "Yet another configuration", null: false
      t.string  "app_title",              default: "Generic title", null: false
      t.string  "relay_email_address",    default: "foo@bar.org",   null: false
      t.integer "user_activation_tokens", default: 2,               null: false
      t.text    "app_privacy_policy",     default: 'Privacy',       null: false
      t.text    "app_imprint",            default: 'Imprint',       null: false
      t.string  "captcha_system",         default: "none",          null: false

      t.timestamps
    end
  end
end
