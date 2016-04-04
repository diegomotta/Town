class Municipality < ActiveRecord::Base
	#Validaciones
	#Relaciones
	belongs_to :town
	has_many :delegations
	belongs_to :mayor, foreign_key: :mayor_id, class_name: "Person"
	belongs_to :submayor, foreign_key: :submayor_id, class_name: "Person"
	has_many :employees
	belongs_to :address
	#Validaciones de relaciones
	validates :submayor_id,  presence: true
	validates :mayor_id,  presence: true

	has_many :events, foreign_key: :parent_id, class_name: "MunicipalityEvent"
	has_many :notices, foreign_key: :parent_id, class_name: "MunicipalityNotice"

end
