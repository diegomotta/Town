class PeopleSerializer < ActiveModel::Serializer
  attributes :id,:first_name,:last_name,:document_type_id,:document_number,:job_address_id,:birth_date,:home_address_id
end
