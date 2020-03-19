class DashboardsController < ApplicationController
  def show
    if current_user.user_type == 'patient'
      redirect_to new_case_path and return
    end
    @unassigned_cases = Case.active
  end
end
