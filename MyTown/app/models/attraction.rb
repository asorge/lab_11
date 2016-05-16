class Attraction < ActiveRecord::Base
	before_validation :find_attraction_coordinates, :if => :street_changed?

	# Rels
	belongs_to :town

	# Scopes
	scope :alphabetical, -> { order('name') }


	private
	def find_attraction_coordinates
		 coord = Geocoder.coordinates("#{street}, #{town.name}, #{town.state}")
		 if coord
	      self.latitude = coord[0]
	      self.longitude = coord[1]
	    else 
	      errors.add(:base, "Error with geocoding")
	    end
	    coord
	end

end
