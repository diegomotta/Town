class MarketType < ActiveRecord::Base
	has_many :supermarkets
	validates :name, presence: true , length: { maximum: 50 , minimum: 6}
	validates :description, presence: true , length: { maximum: 100 , minimum: 6}
end
