class BatimentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_batiment, only: [:show, :edit, :update]

  # GET /batiments
  def index
    @batiments = Batiment.all
  end

  # GET /batiments/1
  def show
  end

  # GET /batiments/new
  def new
    @batiment = Batiment.new
  end

  # GET /batiments/1/edit
  def edit
  end

  # POST /batiments
  def create
    @batiment = Batiment.new(batiment_params)

    respond_to do |format|
      if @batiment.save
        format.html { redirect_to @batiment, notice: 'Le batiment a été bien ajoutée.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /batiments/1
  def update
    respond_to do |format|
      if @batiment.update(batiment_params)
        format.html { redirect_to @batiment, notice: 'Les informations du batiment ont étés bien enregistée.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batiment
      @batiment = Batiment.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batiment_params
      params.require(:batiment).permit(:nom, :abbreger)
    end
end
  