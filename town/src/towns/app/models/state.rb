class State < ActiveRecord::Base
	#Validaciones de atributos
	validates :name, presence: true , length: { maximum: 100 , minimum: 3}
	#Relaciones
	belongs_to :country
	has_many :departments, dependent: :destroy
	#Validaciones de relaciones
	validates_associated :country
	validates :country, :presence => true

end
