class BaseQuery
	def all
		klass.public_send(self.class::SCOPE)
		     .public_send(:select, params)
	end
	
	private

	def klass
		raise NotImplementedError
	end

	def params
		raise NotImplementedError
	end
end
