# frozen_string_literal: true

module Admins
  class EnterprisesController < AdminsController
    before_action :current_enterprise
    before_action :set_enterprise, only: %w[edit update]
    
    def edit; end

    def update
      if current_enterprise && @enterprise.update(params_enterprise)
        redirect_to dashboard_index_path
        flash[:success] = 'Empresa atualizada com sucesso.'
      else
        flash[:danger] = 'Você não tem permissão para atualizar esta empresa'
        redirect_to edit_admins_enterprise_path(current_user.enterprise)
      end
    end

    private

    def current_enterprise
      set_enterprise == current_user.enterprise_id
    end

    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end

    def params_enterprise
      params.require(:enterprise).permit(:logo, :primary_color, :secondary_color)
    end
  end
end
