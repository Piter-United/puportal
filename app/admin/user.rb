ActiveAdmin.register User do
  config.batch_actions = false

  menu label: "Users", priority: 4

  index do
    column :id
    column :name
    column :email
    column :links
    column :avatar do |user|
      image_tag user.avatar
    end
    column :reset_password_sent_at
    column :remember_created_at
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :confirmed_at
    column :confirmation_sent_at
    column :unconfirmed_email
    column :locked_at
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :links do |user|
        link_to user.links, user.links if user.links
      end
      row :avatar do |user|
        image_tag user.avatar
      end
      row :reset_password_sent_at
      row :remember_created_at
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :confirmed_at
      row :confirmation_sent_at
      row :unconfirmed_email
      row :locked_at
      row :created_at
      row :updated_at
    end
  end
end
