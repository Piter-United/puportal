namespace :fake do
  desc "Generate test events"
  task events: [:environment] do
    Community.find_each do |community|
      10.times do
        start = Time.zone.now - rand(10).hours
        finish = start + rand(4).hours

        community.events.create!(
          title: "#{ community.name } event title",
          description: "#{ community.name } event description",
          logo: community.logo,
          start: start,
          finish: finish
        )
      end
    end
  end
end
