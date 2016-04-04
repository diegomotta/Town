class Department < ActiveRecord::Base
	#Validaciones de atributos
	validates :name, presence: true , length: { maximum: 100 , minimum: 3}
	#Relaciones
	belongs_to :state
	has_many :towns, dependent: :destroy
	#Validaciones de relaciones
	validates_associated :state
	validates :state, :presence => true

end
