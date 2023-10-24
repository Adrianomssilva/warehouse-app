class SuppliersController < ApplicationController


  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(suppliers_params)
    @supplier.save
    redirect_to suppliers_path, notice: 'Fornecedor cadastrado com sucesso!'
  end


  private

  def suppliers_params
    params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number, :full_address, :city, :state, :email)
  end
end
