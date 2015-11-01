ActiveAdmin.register Partner do
  config.batch_actions = false

  menu label: "Partners", priority: 7

  permit_params :name, :logo, :url

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :name
      f.input :logo, as: :file
      f.input :url, as: :url
      f.input :status
    end

    f.actions
  end

  show do
    columns do
      column do
        attributes_table do
          row :url do |partner|
            link_to partner.url, partner.url, target: "_blank"
          end
          row :logo do |partner|
            image_tag partner.logo.url
          end
        end
      end
    end
  end
end
