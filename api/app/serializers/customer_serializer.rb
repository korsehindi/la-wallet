class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :avatar_url, :provider, :slug, :email, :location
end
