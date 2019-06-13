class SessionistesImportsController < ApplicationController
  def new
    @sessionistes_import = SessionistesImport.new
  end

  def create
    @sessionistes_import = SessionistesImport.new(params[:sessionistes_import])
    if @sessionistes_import.save
      redirect_to sessionistes_path
    else
      render :new
    end
  end
end
