class AbstractProductResearchUnitController < ApplicationController

  def set_journal(journal_name, created_by_user)
    journal = nil
    if journal_name.is_a? String
      journal_name = journal_name.strip
      journal_name = journal_name.downcase
      journal = Journal.where('lower(name) = ?', journal_name).first
      if journal.nil?
        journal = Journal.new(name: journal_name.titleize,
                              created_by: created_by_user)
        unless journal.save
          render json: { error: journal.errors, method: 'set_journal' },
                 status: :unprocessable_entity and return
        end
      end
    end
    journal
  end

  def set_research_group
    @research_group = ResearchGroup.find(params[:research_group_id])
  end
end
