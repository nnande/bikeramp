module Trips
  class BaseQuery < ::BaseQuery
  private

  def klass
    Trip
  end
  end
end
