class ApplicationService
  require 'json'

  # [{"selector":"group_type_name","desc":false,"isExpanded":true},
  # {"selector":"state_name","desc":false,"isExpanded":false}]
  def self.group_with_query(curr_records, group_list)
    group_list = self.validate_and_rename_fields(group_list)
    puts "Lista group:"
    puts group_list
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "Entre a la recursiva"
    result = self.recursiva(curr_records, group_list)
    puts "Salí de la recursiva"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    result
  end

  def self.recursiva(curr_records, group_list, general_where_query = "")
    if group_list.is_a? Array
      puts "Soy array"
      puts "Tengo #{group_list.size} group list: "
      puts group_list
      puts general_where_query
      puts "---------------------"
      current_filter = group_list[0]
      aux_group_list = group_list[1..]
      query = current_filter["selector"]
      q_select = query + " AS grouping_field, COUNT(*) AS total_per_gf"
      result = []

      puts "Me queda #{aux_group_list.size}"

      # set order
      if current_filter["desc"]
        puts "desc"
        q_order = query + " DESC"
      else
        puts "asc"
        q_order = query + " ASC"
      end

      if general_where_query.empty?
        abstract = curr_records.select("#{q_select}").group("#{query}").order(q_order)
      else
        abstract = curr_records.select("#{q_select}")
                       .where("#{general_where_query}")
                       .group("#{query}").order(q_order)
      end

      if aux_group_list.size > 0
        puts "Tengo más campos por agrupar"
        abstract.each do |group|
          if current_filter["isExpanded"]
            puts "isExpanded es true, #{general_where_query}"
            puts "Agregando uno al result - recursivo"

            if general_where_query.empty?
              aux_where = query + " = " + "'#{group.grouping_field}'"

            else
              aux_where = general_where_query + " AND " + query + " = " + "'#{group.grouping_field}'"
            end
            result.push({
                            'key': group.grouping_field,
                            'items': self.recursiva(curr_records,
                                                    aux_group_list,
                                                    aux_where),
                            'count': group.total_per_gf})
          else
            puts "Agregando uno al result - no recursivo"
            result.push({
                            'key': group.grouping_field,
                            'items': nil,
                            'count': group.total_per_gf})
          end
        end
      else
        puts "No tengo más campos por agrupar"
        abstract.each do |group|
          if current_filter["isExpanded"]
            puts "isExpanded es true, #{general_where_query}"
            if general_where_query.empty?
              puts "Esta vacia"
              aux_where = query + " = " + "'#{group.grouping_field}'"
            else
              puts "No esta vacia"
              aux_where = general_where_query + " AND " + query + " = " + "'#{group.grouping_field}'"
            end
            puts "Real query hijos:"
            puts aux_where
            if group.total_per_gf > 0
              items = curr_records.where("#{aux_where}")
              items = ActiveModelSerializers::SerializableResource.new(items)
            else
              items = nil
            end
            result.push({
                            'key': group.grouping_field,
                            'items': items,
                            'count': group.total_per_gf})
          else
            puts "isExpanded es false, #{general_where_query}"
            result.push({
                            'key': group.grouping_field,
                            'items': nil,
                            'count': group.total_per_gf})
          end
        end
      end
      puts "######################################################33"
      puts "Resultado general"
      puts result
      puts "######################################################33"
      result
    else
      []
    end
  end

  # Create the query from filter, this query is the argument
  # to the "where", this is executed in the Model (curr_records)
  # and return this result (curr_records type bbject)
  def self.search_with_query(curr_records, filter)
    query = self.filter_to_query(filter)
    puts "Query: \n"
    puts query
    unless query.empty?
      curr_records = curr_records.where("#{query}")
    end
    curr_records
  end

  # Create the query from filter, this query is the argument
  # to the "order", this is executed in the Model (curr_records)
  # and return this result (curr_records type bbject)
  def self.sort_with_query(curr_records, order_list)
    query = self.sort_to_query(order_list)
    puts "Query SORT: "
    puts query
    unless query.empty?
      curr_records = curr_records.order("#{query}")
    end
    curr_records
  end

  # Remove text from string and parse one to array
  def self.str2array_and_remove_str(element_str, array_str)
    array_str.each do |single_str|
      element_str = element_str.remove(single_str)
    end
    JSON.parse(element_str)
  end

  # Parse string to array
  def self.str2array_direct(element_str)
    JSON.parse(element_str)
  end


  private

  # Hash of input words to sql words implemented by each class
  def self.get_general_dictionary
    nil
  end

  # Array of valid filter fields (words) implemented by each class
  def self.get_valid_filter_fields
    nil
  end

  # Array of valid sort fields (words) implemented by each class
  def self.get_valid_sort_fields
    nil
  end

  # Create the query SQL from the filter
  def self.filter_to_query(filter_list)
    total_query = ""
    total = self.get_valid_filter_fields
    dictionary = self.get_general_dictionary

    unless total.nil? or dictionary.nil?
      filter_list.each do |filter|
        if filter.is_a? Array and filter.size == 3
          if total.include? filter[0]
            query = map_operator(dictionary[filter[0]], filter[1], filter[2])
            unless query.nil?
              if total_query.empty?
                total_query = query
              else
                total_query += " OR " + query
              end
            end
          end
        end
      end
    end
    total_query
  end

  # Convert operator to query SQL
  def self.map_operator(field, operator, value)
    case operator
    when "="
      if field.include? 'id' and value.to_i != 0
        "#{field} = #{value}"
      end

      unless field.include? 'id'
        "LOWER(#{field}) = LOWER('#{value}')"
      end
    when "contains"
      "LOWER(#{field}) LIKE LOWER('%#{value}%')"
    else
      "#{field} = #{value}"
    end
  end

  # Create the query SQL from the sort
  def self.sort_to_query(sort_list)
    query = ""
    total = self.get_valid_sort_fields
    dictionary = self.get_general_dictionary
    unless total.nil? or dictionary.nil?
      sort_list.each do |ord|
        if total.include? ord["selector"]
          ord["selector"] = dictionary[ord["selector"]]
          if ord["desc"]
            if query.empty?
              query = ord["selector"] + " DESC"
            else
              query += ", " + ord["selector"] + " DESC"
            end
          else
            if query.empty?
              query = ord["selector"] + " ASC"
            else
              query += ", " + ord["selector"] + " ASC"
            end
          end
        end
      end
    end
    query
  end

  def self.validate_and_rename_fields(group_list)
    valid_list = []
    total = self.get_valid_sort_fields
    dictionary = self.get_general_dictionary
    unless total.nil? or dictionary.nil?
      group_list.each do |group|
        if total.include? group["selector"]
          group["selector"] = dictionary[group["selector"]]
          valid_list.push(group)
        end
      end
    end
    valid_list
  end
end
