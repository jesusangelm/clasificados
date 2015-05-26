module ApplicationHelper

  def classified_type_formater(type)
    type == "apartment_rent" ? "Apartamento" : "Casa"
  end

  def date_formater(date)
    date.strftime("%e/%m/%Y %l:%M %p")
  end
end
