class Type < ActiveRecord::Base
		#Relaciones
	belongs_to :town
	#Validaciones de relaciones
	validates_associated :town
	validates :town, :presence => true	
end
