class ResearcherSearchService
  def self.search_researcher(curr_researchers, id_number)
    curr_researchers = curr_researchers.where("researchers.identification_number = '#{id_number}'") if id_number.present?
    curr_researchers
  end
end
