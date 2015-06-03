module ProfilesHelper

  def words_selector_regex(user_keywords)
    user_keywords.scan(/[a-zA-Z\d]+/)
  end

  def classifieds_by_keyword(keyword)
    Classified.where("content @@ :q", q: keyword)
  end
end
