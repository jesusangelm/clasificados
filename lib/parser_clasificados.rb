require 'nokogiri'
require 'open-uri'

class ParserClasificados

  def urls(type)
    case type
    when :apartment_rent
      return  "http://www.elsoldemargarita.com.ve/clasificados/index/fsection:1"
    when :house_rent
      return "http://www.elsoldemargarita.com.ve/clasificados/index/fsection:4"
    end
  end

  def source_data(type)
    url = urls(type)

    return Nokogiri::HTML(open(url))
  end

  def classifieds_info(data)
    return data.css("hr+ p").text
  end

  def classified_lists(data)
    return data.css(".classified").text.split("\r\n")
  end

  def page_ammounts_inspector(type)
    info = classifieds_info(source_data(type))
    pages = info.split(" ")[3].to_i
    return pages
  end

  def url_generator(type, ammount)
    url_list = Array.new
    url_base =  urls(type)

    1.upto(ammount) do |n|
      url_list << url_base + "/page:#{n}"
    end

    return url_list
  end

  def parse_url_generated(type)
    ammount = page_ammounts_inspector(type)
    url_list = url_generator(type, ammount)

    classifieds = Array.new
    url_list.each do |url|
      classifieds << classified_lists(Nokogiri::HTML(open(url)))
    end

    return classifieds.flatten
  end

end

#parser = ParserClasificados.new
#puts parser.parse_url_generated(:apartment_rent)
