class MunicipalityEventSerializer < ActiveModel::Serializer
  attributes  :name,:description,:start_date, :end_date, :responsible_id, :contact_number, :email, :address_id
end
