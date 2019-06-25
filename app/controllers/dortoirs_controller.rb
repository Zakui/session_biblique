class DortoirsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dortoir, only: [:show, :edit, :update]

  # GET /batiments/1/dortoirs/1
  def show
  end

  # GET /batiments/1/dortoirs/new
  def new
      @batiment = Batiment.friendly.find(params[:batiment_id])
      @dortoir = Dortoir.new
  end

  # GET /batiments/1/dortoirs/1/edit
  def edit
  end

  # POST /batiments/1/dortoirs
  def create
    @dortoir = Dortoir.new(dortoir_params)
    @dortoir.place_disponible = params[:dortoir][:capacite].to_i

    respond_to do |format|
      if @dortoir.save
        format.html { redirect_to @batiment, notice: 'Le dortoir a été bien ajoutée.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /batiments/1/dortoirs/1
  def update
    respond_to do |format|
      capa = @dortoir.capacite - params[:dortoir][:capacite].to_i
      dispo = @dortoir.place_disponible - capa
      if dispo < 0
          format.html { render :edit, alert: 'Vous avez plus de sessioniste logé que la capacite du dortoir.' }
      end
      if @dortoir.update(dortoir_params)
          @dortoir.place_disponible = dispo
          @dortoir.save
          format.html { redirect_to @batiment, notice: 'Les informations du dortoir ont étés bien enregistée.' }
      else
          format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dortoir
      @batiment = Batiment.friendly.find(params[:batiment_id])
      @dortoir = Dortoir.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dortoir_params
      params.require(:dortoir).permit(:nom, :abbreger, :capacite, :ocupant)
    end
end
