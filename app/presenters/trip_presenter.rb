class TripPresenter < BasePresenter
  ATTRIBUTES = %i[id price date distance]
  ASSOCIATIONS = %i[start_address destination_address]

  def as_json
    attributes.merge(associations)
  end
	
  private

  def type
    Trip
  end

  def associations
    self.class::ASSOCIATIONS.each_with_object({}) do |assoc, hash|
      hash[assoc] = @object.public_send(assoc).full
    end
  end
end
