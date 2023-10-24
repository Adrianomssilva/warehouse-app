class WarehousesController < ApplicationController

  before_action :set_warehouse, only: [:edit, :update, :show, :destroy]

  def show
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
    redirect_to root_path, notice: 'Galpão cadastrado com sucesso'
    else
    flash.now[:notice] = 'Galpão não cadastrado'
    render 'new'
    end
  end

  def edit
  end

  def update
    if @warehouse.update(warehouse_params)
    redirect_to warehouse_path, notice: 'Galpão editado com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível editar o galpão'
      render 'edit'
    end
  end

  def destroy
    @warehouse.destroy
    redirect_to root_path, notice: 'Galpão removido com sucesso'
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :description, :address, :cep, :area)
  end

end
