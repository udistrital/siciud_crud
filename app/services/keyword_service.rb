class KeywordService


  def self.validate_existence(keyword)
    result = Keyword.find_by("lower(name) LIKE lower(?)", keyword)
    if result
      return result.id
    else
      return nil
    end
  end

  def self.save_keywords(keywords, created_by)
    keyword_ids = []
    keywords.each do |keyword|
      keyword = keyword.to_s
      keyword = keyword.strip
      unless keyword.blank?
        keyword_exists = self.validate_existence(keyword)
        if keyword_exists
          keyword_ids.append(keyword_exists)
        else
          new_keyword = {
            name: keyword.titleize,
            created_by: created_by
          }
          result = Keyword.create!(new_keyword)
          keyword_ids.append(result.id)
        end
      end
    end
    keyword_ids
  end
end