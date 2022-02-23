class DxService < ApplicationService
  require 'json'
  require 'ostruct'

  def self.load(dbSet, params, files = [])
    @dbSet = dbSet
    @params = params

    # Resultado
    result = OpenStruct.new(root: {})

    # 202103120948: Filtro por IDs (ids=507,211,395)
    ids = GetParam(:ids)
    unless ids.nil?
      @dbSet = @dbSet.where("id in (" + ids + ")")
    end

    # 202107040544: Filtro por Facultades (faculties=17,66)
    # 202110070120: Filtro por documento de identidad (member_documents=1234567,7592839481)
    # 202110070120: Filtro por cine detallado (cine_detailed_areas=17,66)
    # 202110070120: Filtro por proyecto curricular (curricular_projects=17,66)
    # 202110070120: Filtro por disciplinas OCDE (oecd_disciplines=17,66)
    # 202110070120: Filtro por líneas de investigación (research_focuses=17,66)
    arr = []
    db_set_column_names = @dbSet.column_names

    fids = GetParam(:faculties)
    if db_set_column_names.include? "faculty_ids" and not fids.nil?
      fids.split(',').each do |id|
        arr.push("faculty_ids @> '{" + id + "}'")
      end
    end

    cine_detailed_ids = GetParam(:cine_detailed_areas)
    if db_set_column_names.include? "cine_detailed_area_ids" and not cine_detailed_ids.nil?
      cine_detailed_ids.split(',').each do |id|
        arr.push("cine_detailed_area_ids @> '{" + id + "}'")
      end
    end

    curricular_project_ids = GetParam(:curricular_projects)
    if db_set_column_names.include? "curricular_project_ids" and not curricular_project_ids.nil?
      curricular_project_ids.split(',').each do |id|
        arr.push("curricular_project_ids @> '{" + id + "}'")
      end
    end

    member_docs = GetParam(:member_documents)
    if db_set_column_names.include? "member_documents" and not member_docs.nil?
      member_docs.split(',').each do |id|
        arr.push("member_documents @> '{" + id + "}'")
      end
    end

    oecd_discipline_ids = GetParam(:oecd_disciplines)
    if db_set_column_names.include? "oecd_discipline_ids" and not oecd_discipline_ids.nil?
      oecd_discipline_ids.split(',').each do |id|
        arr.push("oecd_discipline_ids @> '{" + id + "}'")
      end
    end

    research_focus_ids = GetParam(:research_focuses)
    if db_set_column_names.include? "research_focus_ids" and not research_focus_ids.nil?
      research_focus_ids.split(',').each do |id|
        arr.push("research_focus_ids @> '{" + id + "}'")
      end
    end

    if arr.length > 0
      @dbSet = @dbSet.where(arr.join(" AND "))
    end

    # 202107040722: Filtro por estado (state=1) (state=2)
    # TODO: Determinar si el model tiene el campo 'group_state_id'
    state = GetParam(:state)
    unless state.nil?
      @dbSet = @dbSet.where("group_state_id = " + state)
    end

    # Filtro
    filter = GetParam(:filter)
    unless filter.nil?
      # 202103310321: Nueva con funciones
      sql = GetSqlMapped(JSON.parse(filter))
      result.root[:filter] = sql
      @dbSet = @dbSet.where(sql)
    end

    # Conteo total
    requireTotal = GetParam(:requireTotalCount);
    unless requireTotal.nil?
      result.root[:totalCount] = @dbSet.count
    end

    # Paginado
    take = GetParam(:take, 10);
    skip = GetParam(:skip, 0);
    @dbSet = @dbSet.limit(take.to_i).offset(skip.to_i)

    # Grupo
    group = GetParam(:group)
    unless group.nil?
      sql = []
      dbRes = @dbSet
      pKey = dbRes.primary_key
      JSON.parse(group).map { |element|
        sel = element['selector']
        g = dbRes.group(sel).count
        g.each_with_object({}) do |((sel), count), m|
          sql.push({
                     key: sel,
                     count: count,
                     summary: [count],
                     items: nil
                   })
        end
      }
      result.root[:data] = sql
    else
      # Orden
      sort = GetParam(:sort)
      unless sort.nil?
        sql = []
        JSON.parse(sort).map { |element|
          sql.push(element['selector'] + (element['desc'] ? " DESC" : " ASC"))
        }
        sort = sql.join(", ")
        result.root[:sort] = sort
        @dbSet = @dbSet.order(sort)
      end

      # Final
      result.root[:data] = @dbSet
      # result.root[:data] = @dbSet.includes(users: :avatar_attachment)
    end

    result.root
  end

  private

  def self.GetParam(key, defaultValue = nil)
    @params[key].present? ? @params[key] : defaultValue
  end

  def self.GetSql(element)
    if element.instance_of?(Array) && element.length() == 3 then
      valor = element[2].to_s
      operador = element[1].to_s
      columna = element[0]
      if columna != "id" then
        comodin_inicio = ""
        comodin_final = ""
        separador = columna.include?("_id") ? "" : "'"
        if operador == "contains" || operador == "notcontains" || operador == "startswith" || operador == "endswith"
          comodin_inicio = operador == "startswith" ? "" : "%"
          comodin_final = operador == "endswith" ? "" : "%"
          operador = operador == "notcontains" ? "NOT LIKE" : "LIKE"
          columna = "LOWER(" + columna + ")"
          valor = valor.downcase
          # elsif
          #   operador = "NOT LIKE"
          #   comodin_inicio = "%"
          #   comodin_final = "%"
        end
        # operador = operador == "contains" ? "LIKE" : operador
        valor = separador + comodin_inicio + valor + comodin_final + separador
        return columna.downcase + " " + operador.upcase + " " + valor
      else
        return ""
      end
    end
  end

  def self.GetSqlMapped(expression)
    res = ""
    if expression.instance_of?(Array) then
      if expression.length() > 3 || expression[0].instance_of?(Array)
        expression.map { |element|
          res = res + GetSqlMapped(element)
        }
      else
        res = res + GetSql(expression)
      end
    else
      res = res + " " + expression.upcase + " "
    end
    return res
  end

end