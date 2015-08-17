module ExactTargetSDK
class RetrieveResult < Result
  def initialize(result)
    super(result)
    return if @result[:properties].nil?
    property_array = @result[:properties][:property]

    property_array = [property_array] if property_array.is_a?(Hash)

    property_array.each do |property|
      define_singleton_method property[:name] do
        property[:value]
      end
    end
  end
end
end
