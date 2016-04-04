class Employee < ActiveRecord::Base
	#Relaciones
	belongs_to :municipality
	belongs_to :person

	validates :name, presence: true, length: { maximum: 30 , minimum: 5}
	validates :description, presence: true, length: { maximum: 50 , minimum: 5}
	validates :start_date, presence: true,length: { maximum: 10 , minimum: 7}
	validates :end_date	, presence: true,length: { maximum: 10 , minimum: 7}

	#Validaciones de relaciones
	validates_associated :municipality
	validates :municipality, :presence => true	
	validates_associated :person
	validates :person, :presence => true	


end
