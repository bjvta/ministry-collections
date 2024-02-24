class WeeklyCollectionsController < ApplicationController
  before_action :set_weekly_collection, only: %i[ show edit update destroy ]

  # GET /weekly_collections or /weekly_collections.json
  def index
    @weekly_collections = WeeklyCollection.all
  end

  # GET /weekly_collections/1 or /weekly_collections/1.json
  def show
  end

  # GET /weekly_collections/new
  def new
    @weekly_collection = WeeklyCollection.new
  end

  # GET /weekly_collections/1/edit
  def edit
  end

  # POST /weekly_collections or /weekly_collections.json
  def create
    @weekly_collection = WeeklyCollection.new(weekly_collection_params)

    respond_to do |format|
      if @weekly_collection.save
        format.html { redirect_to weekly_collection_url(@weekly_collection), notice: "Weekly collection was successfully created." }
        format.json { render :show, status: :created, location: @weekly_collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weekly_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekly_collections/1 or /weekly_collections/1.json
  def update
    respond_to do |format|
      if @weekly_collection.update(weekly_collection_params)
        format.html { redirect_to weekly_collection_url(@weekly_collection), notice: "Weekly collection was successfully updated." }
        format.json { render :show, status: :ok, location: @weekly_collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weekly_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_collections/1 or /weekly_collections/1.json
  def destroy
    @weekly_collection.destroy!

    respond_to do |format|
      format.html { redirect_to weekly_collections_url, notice: "Weekly collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_collection
      @weekly_collection = WeeklyCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weekly_collection_params
      params.require(:weekly_collection).permit(:week_date, :amount)
    end
end
