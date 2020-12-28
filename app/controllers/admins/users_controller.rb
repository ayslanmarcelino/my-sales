# frozen_string_literal: true

module Admins
  class UsersController < AdminsController
    before_action :verify_password, only: %w[update]
    before_action :set_user, only: %w[edit update destroy]
    before_action :set_enterprise, only: %w[create new edit update destroy]

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def show; end

    def create
      @user = User.new(params_user)

      @user.save ? (redirect_to admins_users_path, notice: 'Usuário cadastrado com sucesso.') : (render :new)
    end

    def edit; end

    def update
      @user.update(params_user) ? (redirect_to admins_users_path, notice: 'Usuário atualizado com sucesso.') : (render :edit)
    end

    def destroy
      @user.destroy ? (redirect_to admins_users_path, notice: 'Usuário excluído com sucesso.') : (render :index)
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def set_enterprise
      @enterprise = Enterprise.where(id: current_user.enterprise_id)
    end

    def params_user
      params.require(:user)
            .permit(:document_number, :email, :first_name, :is_active, :is_admin, :last_name, :nickname,
                    :enterprise_id, :password, :password_confirmation)
    end

    def verify_password
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].extract!(:password, :password_confirmation)
      end
    end
  end
end
