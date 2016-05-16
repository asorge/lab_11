class Town < ActiveRecord::Base
	# Rels
	has_many :attractions, dependent: :destroy

	# Scopes
	scope :alphabetical, -> { order('name') }

	STATES_LIST = [['Ohio', 'OH'],['Pennsylvania', 'PA'],['West Virginia', 'WV']]
end
