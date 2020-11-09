class AbstractProductResearchUnitController < ApplicationController

  private

  def set_editorial(editorial_name)
    params.permit(:editorial_name)
    editorial = nil
    if editorial_name.is_a? String
      editorial_name = editorial_name.strip
      editorial = Editorial.where('lower(name) = ?', editorial_name.downcase).first
      if editorial.nil?
        editorial = Editorial.new(name: editorial_name)
        unless editorial.save
          render json: editorial.errors, status: :unprocessable_entity
        end
      end
    end
    editorial
  end

  def set_research_group
    @research_group = ResearchGroup.find(params[:research_group_id])
  end
end
