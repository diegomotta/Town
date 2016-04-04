class RadioNoticeSerializer < ActiveModel::Serializer
   attributes :description,:start_date, :end_date, :responsable_id, :email,:title
end
