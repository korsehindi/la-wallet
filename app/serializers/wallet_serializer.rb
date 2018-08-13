class WalletSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :address, :balance, :alias
end
