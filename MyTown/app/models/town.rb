class Town < ActiveRecord::Base

	# Rels
	has_many :attractions, dependent: :destroy

	accepts_nested_attributes_for :attractions, reject_if: lambda { |attraction| attraction[:name].blank? }, allow_destroy: true

	# Scopes
	scope :alphabetical, -> { order('name') }

	STATES_LIST = [['Ohio', 'OH'],['Pennsylvania', 'PA'],['West Virginia', 'WV']]
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

	private
	before_validation :find_town_coordinates
	
end
