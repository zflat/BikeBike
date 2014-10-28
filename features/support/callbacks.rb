add_translations = Array.new
Carmen::World.instance.subregions.each { |country|
  add_translations << "world.#{country.code.downcase}.name"
  if country.subregions?
    country.subregions.each { |region| add_translations << "world.#{country.code.downcase}.#{region.code.downcase}.name" }
  end
}

I18n::Backend::BikeBike::init_tests!# add_translations

#at_exit do
#	I18n::Backend::BikeBike::end_tests!
#end

Before('@javascript') do
  ActiveRecord::Base.shared_connection = nil
  ActiveRecord::Base.descendants.each do |model|
    model.shared_connection = nil
  end
end

Before do
  #DatabaseCleaner.start
  Translation.connection.execute("INSERT INTO translations (locale, key, value) VALUES('en', 'time.formats.date', '%B %d, %Y');")
  Translation.connection.execute("INSERT INTO translations (locale, key, value, is_proc) VALUES('en', 'date.month_names', '[\"~\", \"January\", \"February\", \"March\", \"April\", \"May\", \"June\", \"July\", \"August\", \"September\", \"October\", \"November\", \"December\"]', TRUE);")
  ConferenceType.connection.execute("INSERT INTO conference_types (slug) VALUES ('bikebike'), ('regional'), ('bici-congreso')")
  WorkshopStream.connection.execute("INSERT INTO workshop_streams (slug) VALUES ('mechanics'), ('leisure'), ('interorganizational_relations'), ('ethics_public_relations'), ('organization_management')")
  WorkshopPresentationStyle.connection.execute("INSERT INTO workshop_presentation_styles (slug) VALUES ('discussion'), ('panel'), ('presentation'), ('hands-on'), ('other')")
  #host! 'en.bikebike.org'
  ApplicationController::set_host 'en.bikebike.org'
  ApplicationController::set_location nil
end

After do |scenario|
  save_and_open_page if scenario.failed? && !ENV['FAIL_SILENT']
end
