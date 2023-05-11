class PagesController < ApplicationController
  def after_sign_in_path_for(resource)
    if resource.is_a?(Doctor)
      doctor_root_path
    elsif resource.is_a?(Patient)
      patient_root_path
    else
      super
    end
  end
end
