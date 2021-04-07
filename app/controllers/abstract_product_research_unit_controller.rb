class AbstractProductResearchUnitController < ApplicationController

  def set_editorial(editorial_name, created_by_user)
    editorial = nil
    if editorial_name.is_a? String
      editorial_name = editorial_name.strip
      editorial_name = editorial_name.downcase
      editorial = Editorial.where('lower(name) = ?', editorial_name).first
      if editorial.nil?
        editorial = Editorial.new(name: editorial_name.titleize,
                                  created_by: created_by_user)
        unless editorial.save
          render json: { error: editorial.errors, method: 'set_editorial' },
                 status: :unprocessable_entity and return
        end
      end
    end
    editorial
  end

  def set_institution(institution_name, created_by_user)
    institution = nil
    if institution_name.is_a? String
      institution_name = institution_name.strip
      institution = Institution.where('lower(inst_name) = ?',
                                      institution_name.downcase).first
      if institution.nil?
        institution = Institution.new(inst_name: institution_name,
                                      created_by: created_by_user)
        unless institution.save
          render json: { error: institution.errors, method: 'set_institution' },
                 status: :unprocessable_entity and return
        end
      end
    end
    institution
  end

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
