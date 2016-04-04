class UserSerializer < ActiveModel::Serializer
  attributes :id,:person_id,:username,:password,:password_confirmation,:email,:last_signin,:role_id
end
