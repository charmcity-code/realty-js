class ListingSerializer < ActiveModel::Serializer
  attributes :id, :street, :city, :state, :zip_code, :property_type, :bedrooms, :bathrooms, :list_price, :created_at
end
