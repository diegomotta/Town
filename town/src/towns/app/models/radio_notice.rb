class RadioNotice < Notice
    belongs_to :radio, foreign_key: :parent_id, class_name: "Radio"
	#VER esta validacion de relacion
	validates :radio, :presence => true	

end

