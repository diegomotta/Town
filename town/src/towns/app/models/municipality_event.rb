class MunicipalityEvent < Event
	belongs_to :municipality, foreign_key: :parent_id, class_name: "Municipality"
	#VER esta validacion de relacion
	
	validates :municipality, :presence => true	

end
