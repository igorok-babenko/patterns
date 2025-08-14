# Builder pattern using to create complex objects step by step

class StoreBuilder
  attr_reader :store_params, :store_config_params, :store_location_params

  def initialize(store_params:, store_config_params:, store_location_params:)
    @store_params = store_params
    @store_config_params = store_config_params
    @store_location_params = store_location_params
    @store = Store.new
  end

  def build
    ActiveRecord::Base.transaction do
      create_store
      create_store_config
      create_store_location

      @store.save!
    end

    @store
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def create_store
    @store.assign_attributes(store_params)
  end

  def create_store_config
    @store.assign_attributes(config_attributes: store_config_params)
  end

  def create_store_location
    @store.assign_attributes(location_attributes: store_location_params)
  end
end

# Application code
class StoresController
  def create
    result = StoreBuilder.new(store_params:, store_config_params:, store_location_params:).build

    if result
      redirect_to result
    else
      render :new
    end
  end
  
  private
  
  def store_params
    params.permit(:store_params)
  end

  def store_config_params
    params.permit(:store_config_params)
  end

  def store_location_params
    params.permit(:store_location_params)
  end
end
