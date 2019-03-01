class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date, :buyer_id
  belongs_to :listing
end
