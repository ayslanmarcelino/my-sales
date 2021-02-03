# frozen_string_literal: true

class ProvidersController < UsersController
  before_action :set_provider, only: %w[edit update destroy]

  def index
    @q = Provider.where(enterprise_id: current_user.enterprise_id)
                 .ransack(params[:q])
    @providers = @q.result(distinct: true)
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(params_provider)

    if @provider.save
      redirect_to providers_path 
      flash[:success] = 'Fornecedor cadastrado com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @provider.update(params_provider)
      redirect_to providers_path
      flash[:success] = 'Fornecedor atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    if @provider.destroy
      redirect_to providers_path
      flash[:success] = 'Fornecedor excluído com sucesso.'
    else
      render :index
    end
  end

  private

  def set_provider
    if current_user.enterprise_id == Provider.find(params[:id]).enterprise_id
      @provider = Provider.find(params[:id])
    else
      redirect_to root_path
      flash[:danger] = 'Você não tem permissão para editar este fornecedor.' 
    end
  end

  def params_provider
    params.require(:provider)
          .permit(:company_name, :document_number, :email, :fantasy_name, :observation,
                  :phone_number, :telephone_number, :responsible)
          .with_defaults(enterprise_id: current_user.enterprise_id)
  end
end
