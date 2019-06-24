class PrintTablesController < ApplicationController
  before_action :authenticate_user!
  def index
    @print_tables = PrintTable.all
  end

  def save_selection
      p_table = PrintTable.new
      p_table.titre = params[:description]
      p_table.ids = Hash[params[:ids].collect { |item| [item, item.to_i] } ]
      p_table.save
  
      render json: {id: p_table.id}
  end

  def save_export
    PrintSave.delete_all
    p_save = PrintSave.new
    p_save.ids = Hash[params[:ids].collect { |item| [item, item.to_i] } ]
    p_save.save

    render json: {id: p_save.id}
  end
end