# frozen_string_literal: true

class Patients::RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up_params
    params.require(:patient).permit(:email, :password, :password_confirmation, :first_name, :last_name, :pesel, :address, :phone, :dob, :age, :weight, :height, :sex)
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end
