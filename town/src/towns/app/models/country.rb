class Country < ActiveRecord::Base
	#Validaciones de atributos
	validates :name, presence: true , length: { maximum: 100 , minimum: 3}
	#Relaciones
	has_many :states, dependent: :destroy
	#Validacion de relaciones
	#validates_associated :states
end
