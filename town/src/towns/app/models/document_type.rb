class DocumentType < ActiveRecord::Base
	validates :name, presence: true,length: { maximum: 10 , minimum: 3}
    validates :description, presence: true, length: { maximum: 30 , minimum: 10}

end
