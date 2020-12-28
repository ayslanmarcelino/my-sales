# frozen_string_literal: true

module Admins
  class EnterprisesController < AdminsController
    before_action :set_enterprise, only: %w[edit update]
    
    def edit; end

    def update
      if @enterprise.update(params_enterprise)
        redirect_to dashboard_index_path
        flash[:success] = 'Empresa atualizada com sucesso.'
      else
        redirect_to edit_admins_enterprise_path(current_user.enterprise)
      end
    end

    private

    def set_enterprise
      @enterprise = Enterprise.friendly.find(params[:id])
    end

    def params_enterprise
      params.require(:enterprise).permit(:logo, :primary_color, :secondary_color)
    end
  end
end
