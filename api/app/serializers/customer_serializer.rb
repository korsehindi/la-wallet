class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :email, :slug, :name, :title, :gender, :age, :country
end
