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
    if @supplier.save
    redirect_to suppliers_path, notice: 'Fornecedor cadastrado com sucesso!'
    else
      flash.now[:notice] = 'Fornecedor não cadastrado.'
      render 'new'
      end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(suppliers_params)
      redirect_to supplier_path, notice: 'Fornecedor editado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível editar o fornecedor'
      render 'edit'
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.delete
    redirect_to suppliers_path, notice: 'Fornecedor removido com sucesso'
  end


  private

  def suppliers_params
    params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number, :full_address, :city, :state, :email)
  end
end
