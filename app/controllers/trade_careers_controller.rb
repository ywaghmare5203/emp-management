class TradeCareersController < ApplicationController
  before_action :set_trade_career, only: [:show, :edit, :update, :destroy]

  # GET /trade_careers
  # GET /trade_careers.json
  def index
    @trade_careers = TradeCareer.all
  end

  # GET /trade_careers/1
  # GET /trade_careers/1.json
  def show
  end

  # GET /trade_careers/new
  def new
    @trade_career = TradeCareer.new
  end

  # GET /trade_careers/1/edit
  def edit
  end

  # POST /trade_careers
  # POST /trade_careers.json
  def create
    @trade_career = TradeCareer.new(trade_career_params)

    respond_to do |format|
      if @trade_career.save
        format.html { redirect_to @trade_career, notice: 'Trade career was successfully created.' }
        format.json { render :show, status: :created, location: @trade_career }
      else
        format.html { render :new }
        format.json { render json: @trade_career.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trade_careers/1
  # PATCH/PUT /trade_careers/1.json
  def update
    respond_to do |format|
      if @trade_career.update(trade_career_params)
        format.html { redirect_to @trade_career, notice: 'Trade career was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade_career }
      else
        format.html { render :edit }
        format.json { render json: @trade_career.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trade_careers/1
  # DELETE /trade_careers/1.json
  def destroy
    @trade_career.destroy
    respond_to do |format|
      format.html { redirect_to trade_careers_url, notice: 'Trade career was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade_career
      @trade_career = TradeCareer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_career_params
      params.require(:trade_career).permit(:paab_complete, :paab_result, :next_paab, :tiffy_maths_req, :tiffy_maths_complete, :class_2, :class_1, :artificer)
    end
end
