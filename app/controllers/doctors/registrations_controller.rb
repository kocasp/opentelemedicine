# frozen_string_literal: true
require "net/http"
require "uri"

class Doctors::RegistrationsController < Devise::RegistrationsController
  def create
    # This is a prototype of NIL API integration
    # formatted_dob = sign_up_params["dob"].gsub("-","")
    # pwz_number = sign_up_params["pwz_number"]
    #
    # url = "http://hdt.hipokrates.org/?pwz=#{pwz_number}&data_ur=#{formatted_dob}&format=json"
    # p url
    #
    # uri = URI.parse(url)
    # response = Net::HTTP.get_response(uri)
    # json_response = JSON.parse(response.body)
    # p json_response
    # pwz_verified = (json_response["wynik"] == "1")
    # unless true
    #   redirect_to new_registration_path(User, valid: false, user_type: sign_up_params["user_type"]) and return
    # end
    super
  end

  protected

  def sign_up_params
    params.require(:doctor).permit(:email, :password, :password_confirmation, :first_name, :last_name, :pesel, :address, :phone, :pwz_number, :dob, :age, :weight, :height, :sex)
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end
