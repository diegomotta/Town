class Town < ActiveRecord::Base

  after_create :create_tenant
  #Validaciones de los atributos
  validates :latitude, presence: true,numericality: {allow_nil:  true}
  validates :longitude, presence: true,numericality: {allow_nil:  true}
  validates :time_zone, presence: true
  validates :name, presence: true , length: { maximum: 100 , minimum: 3}
  validates :population , numericality: true, allow_nil:  true
  validates :elevation , numericality: true, allow_nil:  true
  validates :cpa_base, presence: true
  validates :dialing_code, presence: true
  validates :subdomain, uniqueness: {allow_nil: true}
  #Relaciones
  belongs_to :department
  has_one :municipality
  #Validaciones de relaciones
  validates :department, :presence => true
  validates_associated :department



  private
    
    def create_tenant
      sd = name.parameterize.underscore
      # if Town.where(subdomain: sd).first
      #   self.subdomain = %w{ self.department.name sd}.join(" ").parameterize.underscore
      # else
      self.subdomain = sd
        
      self.save  
      Apartment::Tenant.create(subdomain)
    end


end
