ActiveAdmin.register Community do
  config.batch_actions = false

  menu label: "Communities", priority: 2

  index do
    column :id
    column :hashtag do |community|
      status_tag community.hashtag
    end
    column :name
    column :short_name
    column :links
    column :tags do |community|
      if community.tags.any?
        ul do
          community.tags.each do |tag|
            li status_tag tag
          end
        end
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :hashtag
      row :name
      row :short_name
      row :description
      row :created_at
      row :updated_at
      row :links do |community|
        if community.links.present?
          ul do
            li link_to community.links, community.links
          end
        end
      end
      row :tags do |community|
        if community.tags.any?
          ul do
            community.tags.each do |tag|
              li tag
            end
          end
        end
      end
      row :logo do |community|
        image_tag community.logo if community.logo
      end
    end

    panel "Members" do
      table_for community.members.includes(user: :authentications) do
        column :name do |member|
          member.user.name
        end

        column :email do |member|
          member.user.email
        end

        column :accounts do |member|
          member.user.authentications.decorate.each do |auth|
            li auth.link
          end
        end

        column do |member|
          link_to "open", admin_user_path(member.user_id)
        end
      end
    end
  end

  # permit_params :list, :of, :attributes, :on, :model
end
