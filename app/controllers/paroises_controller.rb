class ParoisesController < ApplicationController
  before_action :set_paroise, only: [:show, :edit, :update, :destroy]

  # GET /paroises
  # GET /paroises.json
  def index
    @paroises = Paroise.all
  end

  # GET /paroises/1
  # GET /paroises/1.json
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
  # POST /paroises.json
  def create
    @paroise = Paroise.new(paroise_params)

    respond_to do |format|
      if @paroise.save
        format.html { redirect_to @paroise, notice: 'La paroise a été bien ajoutée.' }
        format.json { render :show, status: :created, location: @paroise }
      else
        format.html { render :new }
        format.json { render json: @paroise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paroises/1
  # PATCH/PUT /paroises/1.json
  def update
    respond_to do |format|
      if @paroise.update(paroise_params)
        format.html { redirect_to @paroise, notice: 'Les informations de la paroise ont étés bien enregistée.' }
        format.json { render :show, status: :ok, location: @paroise }
      else
        format.html { render :edit }
        format.json { render json: @paroise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paroises/1
  # DELETE /paroises/1.json
  def destroy
    @paroise.destroy
    respond_to do |format|
      format.html { redirect_to paroises_url, notice: 'Sessioniste was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paroise
      @paroise = Paroise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paroise_params
      params.require(:paroise).permit(:nom)
    end
end
