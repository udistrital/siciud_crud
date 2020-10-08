class ApplicationService
  require 'json'

  def self.sort_with_query(curr_records, order_list)
    query = self.sort_to_query(order_list)
    puts "Query SORT: "
    puts query
    curr_records.order("#{query}")
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

  # Create the query from filter, this query is the argument
  # to the "where", this is executed in the Model (curr_records)
  # and return this result (Object)
  def self.search_with_query(curr_records, filter)
    query = self.filter_to_query(filter)
    puts "Query: \n"
    puts query
    curr_records.where("#{query}")
  end

  private

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






  def self.get_valid_filter_fields
    nil
  end

  def self.get_valid_sort_fields
    nil
  end

  def self.get_general_dictionary
    nil
  end
end
