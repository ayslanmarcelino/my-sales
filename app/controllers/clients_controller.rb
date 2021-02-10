# frozen_string_literal: true

class ClientsController < UsersController
  before_action :set_client, only: %w[edit update destroy]

  def index
    @q = Client.where(enterprise_id: current_user.enterprise_id)
               .ransack(params[:q])
    @clients = @q.result(distinct: true)
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params_client)

    if @client.save
      redirect_to(clients_path)
      flash[:success] = 'Cliente cadastrado com sucesso.'
    else
      render :new
    end
  end

  def edit;
  end

  def update;
  end

  def destroy
    if @client.destroy
      redirect_to(clients_path)
      flash[:success] = 'Cliente excluído com sucesso.'
    else
      render :index
    end
  end

  private

  def set_client
    if current_user.enterprise_id == Client.find(params[:id]).enterprise_id
      @client = Client.find(params[:id])
    else
      redirect_to(root_path)
      flash[:danger] = 'Você não tem permissão para manipular este cliente.'
    end
  end

  def params_client
    params.require(:client)
          .permit(:first_name, :last_name, :nickname, :document_number, :email, :phone_number,
                  :telephone_number, :enterprise_id)
          .with_defaults(enterprise_id: current_user.enterprise_id)
  end
end
