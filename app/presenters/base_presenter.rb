class BasePresenter
	def initialize(object)
		unless object.is_a?(type)
			raise ArgumentError.new(I18n.t(:invalid_object_type, scope: [:errors, :presenters]))
		end

		@object = object
	end

	def as_json
		raise NotImplemented
	end
	
	private
	
	def type
		raise NotImplemented
	end
	
	def attributes
        	self.class::ATTRIBUTES.each_with_object({}) do |attribute, hash|
                	hash[attribute] = present(attribute)
                end
        end

	def present(attribute)
		@object.public_send(attribute)
	end

end
