class Town < ActiveRecord::Base
	before_validation :find_town_coordinates

	# Rels
	has_many :attractions, dependent: :destroy

	accepts_nested_attributes_for :attractions, reject_if: lambda { |attraction| attraction[:name].blank? }, allow_destroy: true

	# Scopes
	scope :alphabetical, -> { order('name') }

	STATES_LIST = [['Ohio', 'OH'],['Pennsylvania', 'PA'],['West Virginia', 'WV']]
	
	def create_map_link(zoom=12,width=800,height=800)
	  markers = ""; i = 1
	  self.attractions.alphabetical.to_a.each do |attr|
	    markers += "&markers=color:red%7Ccolor:red%7Clabel:#{i}%7C#{attr.latitude},#{attr.longitude}"
	    i += 1
	  end
    	map = "http://maps.google.com/maps/api/staticmap?center= #{latitude},#{longitude}&zoom=#{zoom}&size=#{width}x#{height}&maptype=roadmap#{markers}&sensor=false"
  	end


	private

	def find_town_coordinates
	    coord = Geocoder.coordinates("#{name}, #{state}")
	    if coord
	      self.latitude = coord[0]
	      self.longitude = coord[1]
	    else 
	      errors.add(:base, "Error with geocoding")
	    end
	    coord
	end

	
	
end
