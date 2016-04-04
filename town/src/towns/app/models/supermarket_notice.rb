class SupermarketNotice < Notice
    belongs_to :supermarket, foreign_key: :parent_id, class_name: "Supermarket"
	#VER esta validacion de relacion
	validates :supermarket, :presence => true	

end
