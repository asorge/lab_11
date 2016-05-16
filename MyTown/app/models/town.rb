class Town < ActiveRecord::Base
	
	# Rels
	has_many :attractions, dependent: :destroy

	accepts_nested_attributes_for :attractions, reject_if: lambda { |attraction| attraction[:name].blank? }, allow_destroy: true

	# Scopes
	scope :alphabetical, -> { order('name') }

	STATES_LIST = [['Ohio', 'OH'],['Pennsylvania', 'PA'],['West Virginia', 'WV']]
end
