class ChangeMembersTableForDeviceAuth < ActiveRecord::Migration
  def change
    add_column :members, :encrypted_password,     :string
    add_column :members, :reset_password_token,   :string
    add_column :members, :reset_password_sent_at, :datetime
    add_column :members, :remember_created_at,    :datetime
    add_column :members, :sign_in_count,          :integer, default: 0, null: false
    add_column :members, :current_sign_in_at,     :datetime
    add_column :members, :last_sign_in_at,        :datetime
    add_column :members, :current_sign_in_ip,     :inet
    add_column :members, :last_sign_in_ip,        :inet
    add_column :members, :confirmation_token,     :string
    add_column :members, :confirmed_at,           :datetime
    add_column :members, :confirmation_sent_at,   :datetime
    add_column :members, :unconfirmed_email,      :string
    add_column :members, :locked_at,              :datetime

    add_index :members, :email,                unique: true
    add_index :members, :unconfirmed_email,    unique: true
    add_index :members, :reset_password_token, unique: true
    add_index :members, :confirmation_token,   unique: true
  end
end
