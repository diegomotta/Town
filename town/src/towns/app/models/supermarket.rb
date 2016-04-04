class Supermarket < ActiveRecord::Base

	belongs_to :owner, foreign_key: :owner_id, class_name: "Person"
	belongs_to :address
	#Validaciones de relaciones
	validates_associated :address
	validates :address, :presence => true
	validates :owner_id,  presence: true

	has_many :events, foreign_key: :parent_id, class_name: "SupermarketEvent"
	has_many :notices, foreign_key: :parent_id, class_name: "SupermarketNotice"
	belongs_to :market_type

end
