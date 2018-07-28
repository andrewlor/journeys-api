class Api::V1::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action do
    self.namespace_for_serializer = Api::V1
  end
  
  before_action :authenticate_api_v1_user!

end
