class DashboardsController < ApplicationController
  def show
    if patient_signed_in?
      redirect_to new_case_path and return
    end
    @unassigned_cases = Case.active
  end
end
