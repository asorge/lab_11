class Town < ActiveRecord::Base
	accepts_nested_attributes_for :attractions, reject_if: lambda { |attraction| attraction[:name].blank? }, allow_destroy: true
	
	# Rels
	has_many :attractions, dependent: :destroy

	# Scopes
	scope :alphabetical, -> { order('name') }

	STATES_LIST = [['Ohio', 'OH'],['Pennsylvania', 'PA'],['West Virginia', 'WV']]
end
