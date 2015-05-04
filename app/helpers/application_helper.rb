module ApplicationHelper
  def array_field(object_name, method, options = {})
    ArrayField.new(object_name, method, self, options).render
  end
end
