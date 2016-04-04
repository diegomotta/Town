class EmployeeSerializer < ActiveModel::Serializer
  attributes :id,:person_id,:name,:description,:start_date,:end_date
end
