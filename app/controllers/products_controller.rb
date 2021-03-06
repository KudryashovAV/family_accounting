class ProductsController < ApplicationController
  def index
    @products = Product.group_by_kind
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(resource_params)
    if @product.save
      flash[:notice] = t('application.flash_created')
      redirect_to products_url
    else
      flash[:alert] = t('application.error_created')
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(resource_params)
      flash[:notice] = t('application.flash_created')
      redirect_to products_url
    else
      flash[:alert] = t('application.error_created')
      render :edit
    end
  end

  private

  def resource_params
    params.require(:product).permit(:name, :kind, :description, :calories, :fats,
                                    :manufacturer, :proteins, :carbohydrates, :vitamin_a,
                                    :vitamin_b1, :vitamin_b2, :vitamin_b3,
                                    :vitamin_b4, :vitamin_b5, :vitamin_b6,
                                    :vitamin_b7, :vitamin_b9, :vitamin_b10,
                                    :vitamin_b11, :vitamin_b12, :vitamin_b13,
                                    :vitamin_b15, :vitamin_c, :vitamin_d,
                                    :vitamin_e, :vitamin_k, :vitamin_n,
                                    :vitamin_p, :vitamin_u, :calcium, :iron,
                                    :potassium, :copper, :manganese, :magnesium,
                                    :sodium, :sulfur, :silicon, :zinc, :selenium,
                                    :chrome, :iodine, :additional_options)
  end
end
