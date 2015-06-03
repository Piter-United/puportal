class Calendar < Struct.new(:view, :date, :callback)
  HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
  START_DAY = :sunday

  delegate :content_tag, to: :view

  def table
    content_tag(:table, class: "calendar") do
      header + week_rows
    end
  end

  def header
    content_tag :tr do
      Date::DAYNAMES.inject([]) { |row, day|
        row << content_tag(:th, I18n.t(:"date.standalone_abbr_day_names")[row.size])
        row
      }.join.html_safe
    end
  end

  def week_rows
    weeks.map do |week|
      content_tag :tr do
        week.map { |day| day_cell(day) }.join.html_safe
      end
    end.join.html_safe
  end

  def day_cell(day)
    content_tag :td, view.capture(day, &callback), class: day_classes(day)
  end

  def day_classes(day)
    classes = []
    classes << "today" if day == Date.today
    classes << "not-month" if day.month != date.month
    classes.empty? ? nil : classes.join(" ")
  end

  def weeks
    first = date.beginning_of_month.beginning_of_week(START_DAY)
    last = date.end_of_month.end_of_week(START_DAY)
    (first..last).to_a.in_groups_of(7)
  end
end