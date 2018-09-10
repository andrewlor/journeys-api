class User::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def sign_up_params
    params.permit(*params_for_resource(:sign_up) << :nickname)
  end
end
