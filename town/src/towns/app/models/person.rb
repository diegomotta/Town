class Person < ActiveRecord::Base
	#Relations
	has_many :employees
	belongs_to :job_address, foreign_key: :job_address_id, class_name: "Address"
	belongs_to :home_address, foreign_key: :home_address_id, class_name: "Address"
	belongs_to :document_types, foreign_key: :document_type_id, class_name: "DocumentType"

	validates :first_name, presence: true, length: { maximum: 20 , minimum: 5}
	validates :last_name, presence: true, length: { maximum: 20 , minimum: 5}
	validates :document_number, presence: true,  length: { maximum: 10 , minimum: 7}
	validates :birth_date, presence: true,length: { maximum: 10 , minimum: 10}

	validates_associated :job_address
	validates :job_address, :presence => true		
	validates_associated :home_address
	validates :home_address, :presence => true	

end

