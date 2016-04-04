class Delegation < ActiveRecord::Base
	belongs_to :chief, foreign_key: :chief_id, class_name: "People"
	belongs_to :address
	belongs_to :municipality

	validates_associated :chief
	validates :chief, :presence => true
	validates_associated :address
	validates :address, :presence => true
	validates_associated :municipality
	validates :municipality, :presence => true		
end
