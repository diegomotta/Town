class MunicipalityNotice < Notice
	belongs_to :municipality, foreign_key: :parent_id, class_name: "Municipality"
	validates :municipality, :presence => true	
end
