class MemberWeeklyCollectionsController < ApplicationController
  before_action :set_member_weekly_collection, only: %i[ show edit update destroy ]

  # GET /member_weekly_collections or /member_weekly_collections.json
  def index
    @member_weekly_collections = MemberWeeklyCollection.all
  end

  # GET /member_weekly_collections/1 or /member_weekly_collections/1.json
  def show
  end

  # GET /member_weekly_collections/new
  def new
    @member_weekly_collection = MemberWeeklyCollection.new
  end

  # GET /member_weekly_collections/1/edit
  def edit
  end

  # POST /member_weekly_collections or /member_weekly_collections.json
  def create
    @member_weekly_collection = MemberWeeklyCollection.new(member_weekly_collection_params)

    respond_to do |format|
      if @member_weekly_collection.save
        format.html { redirect_to member_weekly_collection_url(@member_weekly_collection), notice: "Member weekly collection was successfully created." }
        format.json { render :show, status: :created, location: @member_weekly_collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member_weekly_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_weekly_collections/1 or /member_weekly_collections/1.json
  def update
    respond_to do |format|
      if @member_weekly_collection.update(member_weekly_collection_params)
        format.html { redirect_to member_weekly_collection_url(@member_weekly_collection), notice: "Member weekly collection was successfully updated." }
        format.json { render :show, status: :ok, location: @member_weekly_collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member_weekly_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_weekly_collections/1 or /member_weekly_collections/1.json
  def destroy
    @member_weekly_collection.destroy!

    respond_to do |format|
      format.html { redirect_to member_weekly_collections_url, notice: "Member weekly collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_weekly_collection
      @member_weekly_collection = MemberWeeklyCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_weekly_collection_params
      params.require(:member_weekly_collection).permit(:member_id, :weekly_collection_id, :status, :amount, :paid_date)
    end
end
