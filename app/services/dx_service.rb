class DxService < ApplicationService
  require 'json'
  require 'ostruct'  

  def self.load(dbSet, params, files = [])
    @dbSet = dbSet
    @params = params

    # Resultado
    result = OpenStruct.new(root:{})

    # Filtro y grupo
    group = GetParam(:group)
    filter = GetParam(:filter)
    unless filter.nil?
      sql = ""

      # 202103090121: Filtros multiples y unicos
      if filter.include? "[["
        # Filtro multiple
        JSON.parse(filter).map { |element|
          if element.is_a?(Array) then
            if element[0].is_a?(Array) then
              element.map { |subElement|
                tSql = GetSql(element)
                if tSql.length > 0
                  sql += tSql +" "
                end
              }
            else
              tSql = GetSql(element)
              if tSql.length > 0
                sql += " " + tSql +" "
              end
            end
          else
            if element != "" && element != "or"
              sql += element + " "
            end
          end
        }
      else
        # Filtro unico
        tSql = GetSql(JSON.parse(filter))
        if tSql.length > 0
          sql += " " + tSql +" "
        end
        
      end

      sql = sql.squish
      if sql.include?(" = ") && !sql.include?("'")
        arr = sql.split(" = ")
        sql = arr[0]+ "='" + arr[1] + "'"
      end

      result.root[:filter] = sql
      @dbSet = @dbSet.where(sql)

    end

    # Argumentos
    take = GetParam(:take, 10);
    skip = GetParam(:skip, 0);
    requireTotal = GetParam(:requireTotalCount);

    # Conteo total
    unless requireTotal.nil?
      result.root[:totalCount] = @dbSet.count
    end

    # Paginado
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

      # Documentos
      files.each do |file|
        @dbSet.each do |item|
          att = ActiveStorage::Attachment.where(name: file, record_id: item.id)
          if att.any?
            blob = ActiveStorage::Blob.where(id: att[0].blob_id)
            blob = att[0].blob
            unless blob.nil?
            # if blob.any?
              # cidc_act_document
              # https://stackoverflow.com/a/57822787
              # path = rails_blob_path(self.object.facultyActDocument, only_path: true) if self.object.facultyActDocument.attached?
              # item.includes(:images_attachment)
              ActiveStorage::Current.host = "siciud-v2-api.nemedi.com/api/v1"
              # blob = ActiveStorage::Attachment.find_by(record_type: "YourModel", record_id: record.id).blob
              # https://stackoverflow.com/a/51768570
              url = ActiveStorage::Blob.service.url(
                  blob.key,
                  expires_in: 20000,
                  disposition: "inline", #"attachment", # "inline"
                  filename: blob.filename,
                  content_type: blob.content_type
              )
              # if Rails.env.development?
                url =  Rails.application.routes.url_helpers.rails_blob_path(blob,
                  disposition: "attachment", only_path:false, host: "https://siciud-v2-api.nemedi.com/api/v1")
                url = url.split("?")[0]
              # else
              #   url = self.logo&.service_url&.split("?")&.first
              # end
              # url = Rails.application.routes.url_helpers
              #   .rails_blob_url(blob, host: "https://siciud-v2-api.nemedi.com/api/v1")
              item.send(:"#{file}=", url)
              # item[file] = "Diego"
              # attachment = ActiveStorage::Attachment.find(90)
              # attachment.blob.service_url # returns large URI
              # attachment.blob.service_url.sub(/\?.*/, '') # remove query params
            end
          end
        end
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
    if element.is_a?(Array) then
      col = element[1] == "contains" ? "LOWER("+element[0]+")" : element[0]
      if col != "id" then
        op = element[1] == "contains" ? "LIKE" : element[1]
        term = "'"+(element[1] == "contains" ? "%" + element[2].downcase + "%" : element[2])+"'"
        return col.downcase + " " + op.upcase + " " + term
      else
        return ""
      end
    else
      return element+" "
    end
  end

end