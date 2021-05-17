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
    elsif params[:integrated_circuit_diagram_id]
      id = params[:integrated_circuit_diagram_id]
      @context = IntegratedCircuitDiagram.find(id)
    elsif params[:software_id]
      id = params[:software_id]
      @context = Software.find(id)
    elsif params[:plant_ind_prototype_id]
      id = params[:plant_ind_prototype_id]
      @context = PlantIndPrototype.find(id)
    elsif params[:new_scientific_record_id]
      id = params[:new_scientific_record_id]
      @context = NewScientificRecord.find(id)
    elsif params[:event_id]
      id = params[:event_id]
      @context = Event.find(id)
    elsif params[:degree_work_id]
      id = params[:degree_work_id]
      @context = DegreeWork.find(id)
    elsif params[:technical_concept_id]
      id = params[:technical_concept_id]
      @context = TechnicalConcept.find(id)
    elsif params[:distinctive_sign_id]
      id = params[:distinctive_sign_id]
      @context = DistinctiveSign.find(id)
    elsif params[:nutraceutical_product_id]
      id = params[:nutraceutical_product_id]
      @context = NutraceuticalProduct.find(id)
    elsif params[:scientific_collection_id]
      id = params[:scientific_collection_id]
      @context = ScientificCollection.find(id)
    elsif params[:enterprise_secret_id]
      id = params[:enterprise_secret_id]
      @context = EnterpriseSecret.find(id)
    elsif params[:enterprise_id]
      id = params[:enterprise_id]
      @context = Enterprise.find(id)
    elsif params[:innovation_id]
      id = params[:innovation_id]
      @context = Innovation.find(id)
    elsif params[:regulation_id]
      id = params[:regulation_id]
      @context = Regulation.find(id)
    elsif params[:clinical_practice_guideline_id]
      id = params[:clinical_practice_guideline_id]
      @context = ClinicalPracticeGuideline.find(id)
    elsif params[:guide_manual_id]
      id = params[:guide_manual_id]
      @context = GuideManual.find(id)
    elsif params[:protocol_act_id]
      id = params[:protocol_act_id]
      @context = ProtocolAct.find(id)
    elsif params[:bill_id]
      id = params[:bill_id]
      @context = Bill.find(id)
    elsif params[:license_agreement_id]
      id = params[:license_agreement_id]
      @context = LicenseAgreement.find(id)
    elsif params[:appropriation_process_id]
      id = params[:appropriation_process_id]
      @context = AppropriationProcess.find(id)
    elsif params[:appropriation_process_id]
      id = params[:appropriation_process_id]
      @context = AppropriationProcess.find(id)
    elsif params[:creation_workshop_id]
      id = params[:creation_workshop_id]
      @context = CreationWorkshop.find(id)
    end
  end
end
