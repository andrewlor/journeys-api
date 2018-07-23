class ApplicationController < ActionController::Base
  include ActionController::Serialization
  protect_from_forgery
end
