require_relative "../parser_clasificados.rb"

namespace :parser do

  desc "Extrae y muestra los clasificados por Tipos: apartment_rent y house_rent."
  task :get_classifieds, [:type] do |t, args|
    parser_apartment_rent = ParserClasificados.new
    puts parser_apartment_rent.parse_url_generated(args[:type].to_sym)
  end

  desc "Inserta en la BD los clasificados por Tipos: apartment_rent y house_rent."
  task :store_classifieds, [:type] do |t, args|
    type = args[:type]
    parser_apartment_rent = ParserClasificados.new
    classifieds =  parser_apartment_rent.parse_url_generated(type.to_sym)
    classifieds.each do |c|
      Classified.create(content: c, section: type)
    end
  end

  desc "Verifica y elimina los registros en la BD que no estan en la fuente externa."
  task :clean_classifieds, [:type] do |t, args|
    type = args[:type]
    classifieds_stored_list = Array.new
    parser = ParserClasificados.new
    Classified.where(section: type).each { |c| classifieds_stored_list << c.content }
    removable = classifieds_stored_list - parser.parse_url_generated(type.to_sym)
    removable.each { |r| Classified.find_by(content: r).destroy }
  end

end
