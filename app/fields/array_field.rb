class ArrayField < ActionView::Helpers::Tags::TextField

  def value_before_type_cast(object)
     value(object).join(',') unless object.nil?
  end

end
