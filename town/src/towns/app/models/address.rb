class Address < ActiveRecord::Base
	validates :latitude, presence: true,length: { maximum: 10 , minimum: 7}
	validates :longitude, presence: true,length: { maximum: 10 , minimum: 7}
    validates :line_1, presence: true,length: { maximum: 40 , minimum: 10}
    validates :line_2,  allow_nil:true, length: { maximum: 40 }
end
