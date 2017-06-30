class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name

  def revenue
    {'revenue' => nil}
  end

end
