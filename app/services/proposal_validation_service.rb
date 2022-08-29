class ProposalValidationService
  def self.get_default_validation_format
    proposal_validation = {
      "sections": [
        {
          "name": "Palabras claves",
          "required": true,
          "table": "keywords",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 1
        },
        {
          "name": "Evaluadores",
          "required": true,
          "table": "evaluators",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 1
        },
        {
          "name": "Objetivos",
          "required": true,
          "table": "objectives",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 2
        },
        {
          "name": "Cronograma de Actividades",
          "required": true,
          "table": "activity_schedules",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 1
        },
        {
          "name": "Análisis de Riesgos",
          "required": true,
          "table": "risks",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 1
        },
        {
          "name": "Productos Esperados",
          "required": true,
          "table": "proposal_products",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 1
        },
        {
          "name": "Impacto del Proyecto",
          "required": true,
          "table": "impacts",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 1
        },
        {
          "name": "Presupuesto",
          "required": true,
          "table": "proposal_budgets",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 2
        },
        {
          "name": "Descripción de Rubros",
          "required": true,
          "table": "item_details",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 2
        },
        {
          "name": "Capítulos",
          "required": true,
          "table": "chapters",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 9,
          "sentence_complement": "Los capítulos están conformados por:",
          "detail": [
            "(Resumen",
            "Introducción",
            "Descripción del problema",
            "Justificación",
            "Alcance",
            "Marco Teórico y Estado del arte",
            "Metodología",
            "Capacidad del equipo de Investigación/Conformación y trayectoria del Equipo de Investigación",
            "Bibliografía)",
          ]
        },
        {
          "name": "Documentos",
          "required": true,
          "table": "documents",
          "type": nil,
          "subtype": nil,
          "field": nil,
          "minimum_quantity": 2
        }
      ]
    }
    return proposal_validation
  end

  def self.run_validation(proposal)
    # call = proposal.call
    # validations = call.proposal_validation
    response = []
    validations = self.get_default_validation_format
    section_validation = validations[:sections]
    message = self.run_section_validation(proposal, section_validation)
    response.concat(message)

    if response.empty?
      return true, response
    else
      return false, response
    end
  end

  def self.run_section_validation(proposal, validations)
    message = []
    validations.each do |validation|
      reference = validation[:table]
      if reference == "documents"
        d_msg = self.run_document_validation(proposal, validation)
        message.concat(d_msg)
      else
        q_msg = self.run_quantity_validation(proposal, validation, reference)
        message.concat(q_msg)
      end
    end
    return message
  end

  def self.run_document_validation(proposal, validation)
    message = []
    if validation[:type].nil?
      call = proposal.call
      call_documents = call.call_documents
      call_documents.each do |c_document|
        if c_document[:cd_required] == true
          quantity_d = proposal.documents.where("document_type_id = ?", c_document[:document_id]).count
          unless quantity_d > 0
            message.append("El documento '#{c_document.document[:st_name]}' es requerido")
          end
        end
      end
    else
      type_id = validation[:type]
      subtypes = Type.find(type_id).subtypes
      subtypes.each do |subtype|
        if subtype[:required] == true
          quantity_d = proposal.documents.where("document_type_id = ?", subtype[:id]).count
          unless quantity_d > 0
            message.append("El documento '#{subtype[:st_name]}' es requerido")
          end
        end
      end
    end
    return message
  end

  def self.run_quantity_validation(proposal, validation, reference)
    message = []
    minimum_quantity = validation[:minimum_quantity]
    quantity = proposal.send(reference).count
    if quantity < minimum_quantity
      name = validation["name".to_sym]
      message.append("La cantidad mínima de registros para #{name} son: #{minimum_quantity}")
      if validation.has_key? :sentence_complement and not validation[:sentence_complement].nil?
        message.append(validation[:sentence_complement])
        message.concat(validation[:detail])
      end
    end
    return message
  end
end