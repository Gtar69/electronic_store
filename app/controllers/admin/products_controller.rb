class Admin::ProductsController < ApplicationController

  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required 

  def index 
    @products = Product.all
  end  

  def new
    @product = Product.new
    @photo = @product.photos.new
  end  

  def create
    @product = Product.new(product_params) 
    if @product.save
      redirect_to admin_products_path
    else
      render  :new   
    end  
  end  

  def edit 
    @product = Product.find(params[:id])
  end  

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end      
  end  


  def destroy
    @product = Product.find(params[:id])
    @product.destroy!
    flash[:notice] = "已成功將#{@product.title}刪除"
    redirect_to admin_products_path
  end  

  private 
    def product_params 
      params.require(:product).permit(:title, :description, :quantity, :price, :photos_attributes => [:image])    
    end  

end
