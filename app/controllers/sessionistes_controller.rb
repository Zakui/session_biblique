class SessionistesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sessioniste, only: [:show, :edit, :update]

  # GET /sessionistes
  def index
    @paroises = []
    @classes = []
    @groupes = []
    @communautes = []
    @logements = []
    @sessionistes = Sessioniste.all
    @sessionistes.each do |sessioniste|
      if !@paroises.include?({id: sessioniste.paroise.id, nom: sessioniste.paroise.nom})
        @paroises.push({id: sessioniste.paroise.id, nom: sessioniste.paroise.nom})
      end
      if sessioniste.classe && !@classes.include?(sessioniste.classe)
        @classes.push(sessioniste.classe)
      end
      if sessioniste.groupe && !@groupes.include?(sessioniste.groupe)
        @groupes.push(sessioniste.groupe)
      end
      if sessioniste.communaute && !@communautes.include?(sessioniste.communaute)
        @communautes.push(sessioniste.communaute)
      end
      if sessioniste.dortoir && !@logements.include?({id: sessioniste.dortoir.id, nom: sessioniste.dortoir.get_nom_complet})
        @logements.push({id: sessioniste.dortoir.id, nom: sessioniste.dortoir.get_nom_complet})
      end
    end
  end

  # GET /sessionistes/1
  def show
  end

  # GET /sessionistes/new
  def new
    @sessioniste = Sessioniste.new
  end

  # GET /sessionistes/1/edit
  def edit
  end

  # GET /generation-de-badge/1
  def badge
    p_table = PrintTable.friendly.find(params[:id])
    @datas = []
    @id = p_table.hash_id
    items = []
    step = 0
    eval(p_table.ids).each do |key, v|
      if step == 4
        step = 0
        @datas.push(items)
        items = []
      end

      if p_table.titre = 'Sessionistes'
        items.push(Sessioniste.friendly.find(v))
      end

      step = step + 1
    end
    if items.length > 0
      @datas.push(items)
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "bages des sessionistes",
        page_size: 'A4',
        template: "sessionistes/badge.html.erb",
        layout: "pdf.html.erb",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  # GET /fiche-des-sessionistes/1
  def liste
    p_fiche = PrintFiche.friendly.find(params[:id])
    @id = p_fiche.hash_id

    if p_fiche.filtre == 'paroise'
      paroise = Paroise.friendly.find(p_fiche.opt)
      @titre = "Liste des sessionistes de la paroise #{paroise.nom}"
      @data = Sessioniste.friendly.where(paroise: paroise)
    end
    if p_fiche.filtre == 'classe'
      @titre = "Liste des sessionistes de la classe #{p_fiche.opt}"
      @data = Sessioniste.friendly.where(classe: p_fiche.opt)
    end
    if p_fiche.filtre == 'groupe'
      @titre = "Liste des sessionistes du groupe #{p_fiche.opt}"
      @data = Sessioniste.friendly.where(groupe: p_fiche.opt)
    end
    if p_fiche.filtre == 'communaute'
      @titre = "Liste des sessionistes de la communaute #{p_fiche.opt}"
      @data = Sessioniste.friendly.where(communaute: p_fiche.opt)
    end
    if p_fiche.filtre == 'logement'
      if p_fiche.opt == 'non loger'
        @titre = "Liste des sessionistes non loger"
        @data = Sessioniste.friendly.where(dortoir: nil)
      else
        dortoir = Dortoir.friendly.find(p_fiche.opt)
        @titre = "Liste des sessionistes du dortoir #{dortoir.get_nom_complet}"
        @data = Sessioniste.friendly.where(dortoir: dortoir)
      end
    end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "liste des sessionistes",
        page_size: 'A4',
        disposition: 'attachment',
        template: "sessionistes/liste.html.erb",
        layout: "pdf.html.erb",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  # GET /loger-les-sessionistes
  def loger
    while Sessioniste.where(dortoir: nil).length > 0
      paroises_f = get_paroise_for_logement_by_sexe('F')
      paroises_g = get_paroise_for_logement_by_sexe('M')
      
      paroises_f.each do |paroise_f|
          Dortoir.where(ocupant: 'Filles').where("place_disponible > ?", 0).each do |dortoir|
              sessioniste = paroise_f.pick_one_sessioniste('F')
              if sessioniste
                sessioniste.loger_sessioniste(dortoir)
              else
                  break
              end
          end
          
      end
      paroises_g.each do |paroise_g|
          Dortoir.where(ocupant: 'Garçons').where("place_disponible > ?", 0).each do |dortoir|
              sessioniste = paroise_g.pick_one_sessioniste('M')
              if sessioniste
                sessioniste.loger_sessioniste(dortoir)
              else
                  break
              end
          end
      end
    end
    @dortoirs = Dortoir.where(ocupant: 'Filles').or(Dortoir.where(ocupant: 'Garçons'))
  end

  # GET /ajouter-aux-communaute
  def ajouter_aux_communautes
    while Sessioniste.where(communaute: nil).length > 0
      paroises = get_paroise_for_communaute
      
      paroises.each do |paroise|
        ['SAINT MATTHIEU', 'SAINT JEAN', 'SAINT LUC', 'SAINT MARC'].each do |communaut|
              sessioniste = paroise.pick_one_sessioniste_sans_communaute
              if sessioniste
                sessioniste.ajouter_a_une_communaute(communaut)
              else
                  break
              end
          end
      end
    end
    redirect_to root_path, notice: 'Tout les sessionistes on été ajouter a des communautés.'
  end

  # GET /exporter-en-excel/1
  def exporter_excel
    p_save = PrintSave.friendly.find(params[:id])
    @sessionistes = []
    eval(p_save.ids).each do |key, v|
      @sessionistes.push(Sessioniste.friendly.find(v))
    end

    render xlsx: 'exporter_excel', template: 'rapport/exporter_excel.xlsx.axlsx'
  end

  # POST /sessionistes
  def create
    @sessioniste = Sessioniste.new(sessioniste_params)

    respond_to do |format|
      if @sessioniste.save
        format.html { redirect_to @sessioniste, notice: 'Le sessioniste a été bien ajoutée.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /sessionistes/1
  def update
    respond_to do |format|
      if @sessioniste.update(sessioniste_params)
        format.html { redirect_to @sessioniste, notice: 'Les informations du sessioniste ont étés bien enregistée.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sessioniste
      @sessioniste = Sessioniste.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sessioniste_params
      params.require(:sessioniste).permit(:prenoms, :nom, :sexe, :nombre_participation, :age, :classe, :derniere_classe, :telephone, :dortoir_id, :paroise_id)
    end

    def get_paroise_for_logement_by_sexe(sexe)
      @paroises = []
      Paroise.all.each do |paroise|
          if paroise.sessionistes.where(dortoir: nil, sexe: sexe).length > 0
              @paroises.push(paroise)
          end
      end
      @paroises
    end

    def get_paroise_for_communaute
      @paroises = []
      Paroise.all.each do |paroise|
          if paroise.sessionistes.where(communaute: nil).length > 0
              @paroises.push(paroise)
          end
      end
      @paroises
    end
end
