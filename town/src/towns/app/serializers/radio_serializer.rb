class RadioSerializer < ActiveModel::Serializer
  attributes :id,:name,:owner_id, :address_id, :telefone, :email
end
