class SessionistesImport
    include ActiveModel::Model
    require 'roo'
  
    attr_accessor :paroise
    attr_accessor :file
  
    def initialize(attributes={})
      attributes.each { |name, value| send("#{name}=", value) }
    end
  
    def persisted?
      false
    end
  
    def open_spreadsheet
      case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end
  
    def load_imported_sessionistes
      spreadsheet = open_spreadsheet
      header = spreadsheet.row(5)
      (6..spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        sessioniste = Sessioniste.new
        sessioniste.prenoms = row['Prenoms'].capitalize
        sessioniste.nom = row['Nom'].upcase
        sessioniste.sexe = row['SEXE'].upcase
        sessioniste.nombre_participation = row['Nombre de participation']
        sessioniste.age = row['AGE']
        sessioniste.derniere_classe = row['Derniere Classe'] ? row['Derniere Classe'].upcase : ''
        sessioniste.telephone = row['Contact']
        sessioniste.paroise = Paroise.find(paroise)
        sessioniste
      end
    end
  
    def imported_sessionistes
      @imported_sessionistes ||= load_imported_sessionistes
    end
  
    def save
    if imported_sessionistes.map(&:valid?).all?
        imported_sessionistes.each(&:save!)
        true
      else
        imported_sessionistes.each_with_index do |sessioniste, index|
          sessioniste.errors.full_messages.each do |msg|
            errors.add :base, "Row #{index + 6}: #{msg}"
          end
        end
        false
      end
    end
  
  end