class CallService

  def self.get_call_code(call_type_id)
    year = DateTime.now.in_time_zone(-5).year
    abbreviation_result = get_abbreviation_call_type(call_type_id)
    if abbreviation_result[0]
      consecutive_number = get_consecutive_number(year, abbreviation_result[1])
      call_code = "#{year}-#{abbreviation_result[1]}-#{consecutive_number}"
      return call_code, nil
    else
      return nil, "#{abbreviation_result[1]}, the call code cannot be created."
    end
  end

  private

  def self.get_abbreviation_call_type(call_type_id)
    call_type = Subtype.find_by("id = ?", call_type_id)
    if call_type
      abbreviation = call_type.st_description
      puts "abbreviature"
      puts abbreviation
      valid, msg = validate_abbreviation(abbreviation)
      if valid
        [true, abbreviation.strip]
      else
        [false, msg]
      end
    else
      [false, "Call type not found"]
    end
  end

  def self.get_consecutive_number(year, abbr)
    total = Call.where("call_code LIKE '%#{year}_#{abbr}%'").order(:created_at).count
    "%03d" % (total + 1)
  end

  def self.validate_abbreviation(abbr)
    pattern_not_word = /[^\wñÑáÁéÉíÍóÓúÚüÜ]/
    if abbr.blank?
      return [false, "The type has no description"]
    else
      abbr = abbr.strip
    end
    if pattern_not_word.match?(abbr)
      return [false, "The abbreviation must not contain special characters, or whitespaces"]
    end
    return [true, nil]
  end
end
