class Notice < ActiveRecord::Base
		validates :start_date, presence: true,length: { maximum: 10 , minimum: 10}
		validates :end_date,presence: true, length: { maximum: 10 , minimum: 10}
		validates :email, presence: true
		validates :title, presence: true, length: { maximum: 30 , minimum: 5}
		validates :description, presence: true, length: { maximum: 200 , minimum: 5}
end
