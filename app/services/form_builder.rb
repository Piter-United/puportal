class FormBuilder < ActionView::Helpers::FormBuilder
  def array_field(method, options = {})
    @template.array_field(@object_name, method, objectify_options(options))
  end
end
