class AddressSerializer < ActiveModel::Serializer
  attributes :id,:line_1,:line_2,:latitude,:longitude
end
