# frozen_string_literal: true

class ProductCategoriesController < UsersController
  before_action :set_product_category, only: %w[edit update destroy]

  def index
    @q = ProductCategory.where(enterprise_id: current_user.enterprise_id)
                 .ransack(params[:q])
    @product_categories = @q.result(distinct: true)
  end

  def new
    @product_category = ProductCategory.new
  end

  def create
    @product_category = ProductCategory.new(params_product_category)

    if @product_category.save
      redirect_to product_categories_path 
      flash[:success] = 'Categoria cadastrado com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product_category.update(params_product_category)
      redirect_to product_categories_path
      flash[:success] = 'Categoria atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    if @product_category.destroy
      redirect_to product_categories_path
      flash[:success] = 'Categoria excluído com sucesso.'
    else
      render :index
    end
  end

  private

  def set_product_category
    if current_user.enterprise_id == ProductCategory.find(params[:id]).enterprise_id
      @product_category = ProductCategory.find(params[:id])
    else
      redirect_to root_path
      flash[:danger] = 'Você não tem permissão para editar esta categoria.' 
    end
  end

  def params_product_category
    params.require(:product_category)
          .permit(:description)
          .with_defaults(enterprise_id: current_user.enterprise_id)
  end
end
