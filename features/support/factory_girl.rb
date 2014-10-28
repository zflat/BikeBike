FactoryGirl.define do
	factory :upcoming_conference, :class => 'Conference' do
		title				'My Bike!Bike!'
		slug				'MyBikeBike'
		info 				'Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.'
		poster 				'poster.jpg'
		cover 				'cover.jpg'
		registration_open	false
		start_date 			Date.today - 30.days
		end_date 			Date.today - 26.days
		conference_type_id	(ConferenceType.find_by(:slug => 'bikebike') || ConferenceType.create(:slug => 'bikebike')).id
	end

	factory :org, :class => 'Organization' do
		name				'My Organization'
		info 				'Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.'
		avatar 				'avatar.jpg'
		cover 				'cover.jpg'
	end
end

World(FactoryGirl::Syntax::Methods)

def create_org(name = nil, location = nil)
	org = FactoryGirl.create(:org)
	found_location = nil
	if !location.nil?
		l = Geocoder.search(location).first
		begin
			found_location = Location.new(city: l.city, territory: l.province_code, country: l.country_code, latitude: l.latitude, longitude: l.longitude)
		rescue; end
		if found_location.nil?
			return
		end
	end
	if !name.nil?
		org.name = name
		org.slug = org.generate_slug(name, found_location)
	end
	if !found_location.nil?
		org.locations << found_location
	end
	org.save!
	org
end
