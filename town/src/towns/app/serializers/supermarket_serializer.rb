class SupermarketSerializer < ActiveModel::Serializer
  attributes :id,:name, :owner_id, :address_id, :telefone, :email
end
