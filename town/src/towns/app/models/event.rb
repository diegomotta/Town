class Event < ActiveRecord::Base
	#Relaciones
  	    validates :type, presence: true
		validates :name,presence: true, length: { maximum: 100 , minimum: 5}
		validates :description, presence: true, length: { maximum: 200 , minimum: 5}
		validates :start_date, presence: true, length: { maximum: 10 , minimum: 10}
		validates :end_date, presence: true,length: { maximum: 10 , minimum: 10}
		validate :stardate_less_than_enddate
		validates :contact_number, presence: true,length: { maximum: 20 , minimum: 5}
	    validates :email, presence: true
	    


	def self.search_event(start_date,end_date)
	    where("start_date >= ? AND end_date <= ?", start_date, end_date)
	end   


  private

    def stardate_less_than_enddate
      unless start_date <= end_date
        errors.add(:base, "Specify a charge or a payment, not both")
      end
    end
end
