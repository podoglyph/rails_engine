class BestDaySerializer < ActiveModel::Serializer
  attribute :best_day

  def best_day
    object
  end

end
