class VillageCategory < ActiveRecord::Base
	has_and_belongs_to_many :villages
end
