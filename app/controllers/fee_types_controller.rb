class FeeTypesController < ApplicationController
  before_action :set_fee_type, only: %i[ show edit update destroy ]

  # GET /fee_types or /fee_types.json
  def index
    @fee_types = FeeType.all
  end

  # GET /fee_types/1 or /fee_types/1.json
  def show
  end

  # GET /fee_types/new
  def new
    @fee_type = FeeType.new
  end

  # GET /fee_types/1/edit
  def edit
  end

  # POST /fee_types or /fee_types.json
  def create
    @fee_type = FeeType.new(fee_type_params)

    respond_to do |format|
      if @fee_type.save
        format.html { redirect_to fee_type_url(@fee_type), notice: "Fee type was successfully created." }
        format.json { render :show, status: :created, location: @fee_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fee_types/1 or /fee_types/1.json
  def update
    respond_to do |format|
      if @fee_type.update(fee_type_params)
        format.html { redirect_to fee_type_url(@fee_type), notice: "Fee type was successfully updated." }
        format.json { render :show, status: :ok, location: @fee_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fee_types/1 or /fee_types/1.json
  def destroy
    @fee_type.destroy!

    respond_to do |format|
      format.html { redirect_to fee_types_url, notice: "Fee type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee_type
      @fee_type = FeeType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fee_type_params
      params.require(:fee_type).permit(:name, :amount)
    end
end
