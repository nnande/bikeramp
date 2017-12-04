TripSchema = Dry::Validation.Form do
  configure do
    def self.messages
      super.merge(
        en: {
       	  errors: {
            start_address: I18n.t(:address, kind: :start, scope: [:errors, :schemas, :trip]),
	    destination_address: I18n.t(:address, kind: :destination, scope: [:errors, :schemas, :trip])
          }
       	})
    end
  end

  required(:price).value(format?: /\A\d+(\.\d{2})?\Z/)
  required(:date).value(format?: /\A\d{2}-\d{2}-\d{4}\Z/) # FIXME some day... ;)
  required(:start_address).filled(:str?)
  required(:destination_address).filled(:str?)

  %i[start_address destination_address].each do |address|
    validate(address => address) do |address|
      address.split(',').size.eql?(3)	
    end
  end
end
