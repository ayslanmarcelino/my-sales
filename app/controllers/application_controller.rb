# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :is_active?

  def is_active?
    if current_user.present? && !current_user.is_active?
      sign_out(current_user)
      flash[:danger] = 'Sua conta está inativa. Para mais informações, entre em contato com o administrador da empresa.'
      root_path
    end
  end
end
