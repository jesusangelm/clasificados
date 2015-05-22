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

end
