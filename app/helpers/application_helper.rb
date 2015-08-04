module ApplicationHelper
  def array_field(object_name, method, options = {})
    ArrayField.new(object_name, method, self, options).render
  end

  def calendar(date = Time.zone.today, &block)
    Calendar.new(self, date, block).table.html_safe
  end

  def cover(title: nil, description: nil, image: nil)
    options = {
      cover_title: title,
      cover_description: description,
      cover_image: image
    }

    options[:cover_links] = yield.try(:html_safe) if block_given?

    render partial: "cover", locals: options
  end
end
