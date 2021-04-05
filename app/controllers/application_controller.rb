class ApplicationController < ActionController::API

  # Handling of database exceptions
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::InvalidForeignKey do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def active_in_body_params? (body)
    active_in_body = (body.include? "active") || (body.include? :active)
    unless active_in_body
      render json: { error: "active can't be nil" }, status: :unprocessable_entity
    end
  end

  def set_general_context
    if params[:research_group_id]
      id = params[:research_group_id]
      @context = ResearchGroup.find(id)
    else
      set_product_context
    end
  end

  def set_product_context
    if params[:book_id]
      id = params[:book_id]
      @context = Book.find(id)
    elsif params[:book_chapter_id]
      id = params[:book_chapter_id]
      @context = BookChapter.find(id)
    elsif params[:ip_livestock_breed_id]
      id = params[:ip_livestock_breed_id]
      @context = IpLivestockBreed.find(id)
    elsif params[:new_animal_breed_id]
      id = params[:new_animal_breed_id]
      @context = NewAnimalBreed.find(id)
    elsif params[:paper_id]
      id = params[:paper_id]
      @context = Paper.find(id)
    elsif params[:patent_id]
      id = params[:patent_id]
      @context = Patent.find(id)
    elsif params[:research_creation_work_id]
      id = params[:research_creation_work_id]
      @context = ResearchCreationWork.find(id)
    elsif params[:scientific_note_id]
      id = params[:scientific_note_id]
      @context = ScientificNote.find(id)
    elsif params[:vegetable_variety_id]
      id = params[:vegetable_variety_id]
      @context = VegetableVariety.find(id)
    elsif params[:industrial_design_id]
      id = params[:industrial_design_id]
      @context = IndustrialDesign.find(id)
    end
  end
end
