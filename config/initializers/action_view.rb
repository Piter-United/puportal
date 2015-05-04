Rails.application.config.after_initialize do
  ActionView::Base.default_form_builder = ::FormBuilder
end