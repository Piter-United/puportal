class Time
  def self.current_month
    Time.zone.today.beginning_of_month..Time.zone.today.end_of_month
  end

  def self.current_week
    Time.zone.today.beginning_of_week..Time.zone.today.end_of_week
  end
end