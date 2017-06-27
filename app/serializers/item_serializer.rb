class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  def unit_price
    object.unit_price.to_s.insert(-3, '.')
  end

end
