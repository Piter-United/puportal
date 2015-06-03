module ApplicationHelper
  def array_field(object_name, method, options = {})
    ArrayField.new(object_name, method, self, options).render
  end

  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table.html_safe
  end
end
