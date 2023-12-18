class Api::V1::WarehousesController <ActionController::API

  def show
    warehouse = Warehouse.find(params[:id])
    render status: 200, json: warehouse.as_json(except: ["created_at", "area", "update_at"])
  end
end
