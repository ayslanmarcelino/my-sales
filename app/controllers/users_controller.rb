# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_active_or_employee?

  private

  def is_active_or_employee?
    redirect_to root_path, notice: 'Você não tem permissão para acessar esta página' if current_user.is_employee == false || current_user.is_active == false
  end
end
