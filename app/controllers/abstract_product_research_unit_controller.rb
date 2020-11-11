class AbstractProductResearchUnitController < ApplicationController

  private

  def set_editorial(editorial_name)
    params.permit(:editorial_name)
    editorial = nil
    if editorial_name.is_a? String
      editorial_name = editorial_name.strip
      editorial_name = editorial_name.downcase
      editorial = Editorial.where('lower(name) = ?', editorial_name).first
      if editorial.nil?
        editorial = Editorial.new(name: editorial_name.titleize)
        unless editorial.save
          render json: editorial.errors, status: :unprocessable_entity
        end
      end
    end
    editorial
  end

  def set_journal(journal_name)
    params.permit(:journal_name)
    journal = nil
    if journal_name.is_a? String
      journal_name = journal_name.strip
      journal_name = journal_name.downcase
      journal = Journal.where('lower(name) = ?', journal_name).first
      if journal.nil?
        journal = Journal.new(name: journal_name.titleize)
        unless journal.save
          render json: journal.errors, status: :unprocessable_entity
        end
      end
    end
    journal
  end

  def set_research_group
    @research_group = ResearchGroup.find(params[:research_group_id])
  end
end
