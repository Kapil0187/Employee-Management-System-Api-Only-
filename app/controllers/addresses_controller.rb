class AddressesController < ApplicationController
  before_action :set_employee, only: [:create, :update, :destroy]
  before_action :set_address, only: [:update,:destroy]
  def index
    
  end

  def create
    @address = @employee.create_address(address_params)
    if @address.save 
      render json: @address, status:200
    end
  end

  def update
    if @address.update(address_params)
      render json: @address, status: :ok
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy
    render json: { message: 'Address deleted successfully' }, status: :no_content
  end

  private

  def set_employee
    @employee = Employee.find_by(id: params[:id])
    render json: { error: 'Employee not found' }, status: :not_found unless @employee
  end 

  def set_address
    @address = Address.find_by(id: params[:id])
    render json: { error: 'Address not found' }, status: :not_found unless @address
  end

  def address_params
    params.permit(:city,:state,:country,:address,:pin_code)
  end
end