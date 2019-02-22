class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.where(nil)
    puts params.inspect
    @houses = House.where(list_price: params[:listPriceLow]..params[:listPriceHigh]) if
        params[:listPriceLow].present? and params[:listPriceHigh].present?
    @houses = House.where(square_footage: params[:squareFootageLow]..params[:squareFootageHigh]) if
        params[:squareFootageLow].present? and params[:squareFootageHigh].present?
    @houses = House.where("location like ?", "#{params[:location]}%") if params[:location].present?
  end

  def search

  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
    @house.update(user_id: current_user.id)
    @house.update(company_id: current_user.company_id)
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:user_id, :location, :square_footage, :year_built, :style, :list_price, :no_of_floors, :basement, :current_house_owner, :contact_info, :potential_buyers, :image, :listPriceLow, :listPriceHigh, :squareFootageLow, :squareFootageHigh, :company_id)
    end
end
