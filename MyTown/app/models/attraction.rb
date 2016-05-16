class Attraction < ActiveRecord::Base
	# Rels
	belongs_to :town

	# Scopes
	scope :alphabetical, -> { order('name') }
	
end
