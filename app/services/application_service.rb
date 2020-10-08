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
    conditions = []
    query = ""
    filter_list.each do |filter|
      if filter.is_a? Array and filter.size == 3
        query = map_operator(filter[0], filter[1], filter[2])
        unless query.nil?
          conditions.push(query)
        end
      end
    end
    conditions.each do |condition|
      if query.empty?
        query = condition
      else
        query = query + " OR " + condition
      end
    end
    query
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

  def self.sort_to_query(sort_list)
    puts "EN el ordenador query"
    puts sort_list
    puts sort_list.class
    puts "$$$$$$$$$$"
    query = ""
    sort_list.each do |ord|
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
    query
  end
end
