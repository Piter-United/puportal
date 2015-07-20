ActiveAdmin.register Event do
  config.batch_actions = false

  menu label: "Events", priority: 3

  index do
    column :title
    column :community do |event|
      link_to event.community.name, admin_community_path(event.community.id)
    end
    column :description
    column :address do |event|
      link_to event.address, "link_to_map" # TODO
    end
    column :tags do |event|
      if event.tags.any?
        ul do
          event.tags.each do |tag|
            li status_tag tag
          end
        end
      end
    end
    column :date do |event|
      event.decorate.datetime
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :community  do |event|
        link_to event.community.name, admin_community_path(event.community.id)
      end
      row :address do |event|
        link_to event.address, "link_to_map" # TODO
      end
      row :logo do |event|
        image_tag event.logo
      end
      row :tags  do |event|
        if event.tags.any?
          ul do
            event.tags.each do |tag|
              li status_tag tag
            end
          end
        end
      end
      row :date do |event|
        event.decorate.datetime
      end
      row :created_at
      row :updated_at
    end

    panel "Participants" do
      # TODO
    end
  end
end
