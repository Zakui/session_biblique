class ParoisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paroise, only: [:show, :edit, :update]

  # GET /paroises
  def index
    @paroises = Paroise.all
  end

  # GET /paroises/1
  def show
  end

  # GET /paroises/new
  def new
    @paroise = Paroise.new
  end

  # GET /paroises/1/edit
  def edit
  end

  # POST /paroises
  def create
    @paroise = Paroise.new(paroise_params)

    respond_to do |format|
      if @paroise.save
        format.html { redirect_to @paroise, notice: 'La paroise a été bien ajoutée.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /paroises/1
  def update
    respond_to do |format|
      if @paroise.update(paroise_params)
        format.html { redirect_to @paroise, notice: 'Les informations de la paroise ont étés bien enregistée.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paroise
      @paroise = Paroise.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paroise_params
      params.require(:paroise).permit(:nom)
    end
end
