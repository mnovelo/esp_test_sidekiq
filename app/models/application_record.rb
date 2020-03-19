class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_global_id(params = {})
    super(params.merge(tenant: Apartment::Tenant.current))
  end
  alias to_gid to_global_id

  def to_signed_global_id(params = {})
    SignedGlobalID.create(self, params.merge(tenant: Apartment::Tenant.current))
  end
  alias to_sgid to_signed_global_id

  GlobalID::Locator.use :'esp-test-sidekiq' do |gid|
    Apartment::Tenant.switch!(gid.params[:tenant])
    gid.model_class.find(gid.model_id)
  end

end
