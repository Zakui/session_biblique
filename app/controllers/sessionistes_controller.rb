class SessionistesController < ApplicationController
  before_action :set_sessioniste, only: [:show, :edit, :update, :destroy]

  # GET /sessionistes
  # GET /sessionistes.json
  def index
    @sessionistes = Sessioniste.all
  end

  # GET /sessionistes/1
  # GET /sessionistes/1.json
  def show
  end

  # GET /sessionistes/new
  def new
    @sessioniste = Sessioniste.new
  end

  # GET /sessionistes/1/edit
  def edit
  end

  # POST /sessionistes
  # POST /sessionistes.json
  def create
    @sessioniste = Sessioniste.new(sessioniste_params)

    respond_to do |format|
      if @sessioniste.save
        format.html { redirect_to @sessioniste, notice: 'Le sessioniste a été bien ajoutée.' }
        format.json { render :show, status: :created, location: @sessioniste }
      else
        format.html { render :new }
        format.json { render json: @sessioniste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessionistes/1
  # PATCH/PUT /sessionistes/1.json
  def update
    respond_to do |format|
      if @sessioniste.update(sessioniste_params)
        format.html { redirect_to @sessioniste, notice: 'Les informations du sessioniste ont étés bien enregistée.' }
        format.json { render :show, status: :ok, location: @sessioniste }
      else
        format.html { render :edit }
        format.json { render json: @sessioniste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessionistes/1
  # DELETE /sessionistes/1.json
  def destroy
    @sessioniste.destroy
    respond_to do |format|
      format.html { redirect_to sessionistes_url, notice: 'Sessioniste was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sessioniste
      @sessioniste = Sessioniste.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sessioniste_params
      params.require(:sessioniste).permit(:prenoms, :nom, :sexe, :nombre_participation, :age, :classe, :derniere_classe, :telephone, :chambre_id, :paroise_id)
    end
end
