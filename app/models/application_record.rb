class ApplicationRecord < ActiveRecord::Base
  include Swagger::ErrorSchema
  include Swagger::ChangeActiveSchema

  self.abstract_class = true

  # Tracking
  # https://stackoverflow.com/questions/2933582/rails-migration-t-references-with-alternative-name
  # https://www.fatlemon.co.uk/2018/08/foreign-keys-to-custom-primary-key-caveats-in-ruby-on-rails/
  belongs_to :user, foreign_key: 'created_by', optional: true
  belongs_to :user, foreign_key: 'updated_by', optional: true

  def validate_created_by
    user_id = self.created_by
    if user_id and not user_id.blank?
      begin
        User.find(user_id)
      rescue ActiveRecord::RecordNotFound => e
        errors.add(:created_by, "#{e}, exactly 'created_by': #{user_id}")
      end
    end
  end

  def validate_updated_by
    user_id = self.updated_by
    if user_id and not user_id.blank?
      begin
        User.find(user_id)
      rescue ActiveRecord::RecordNotFound => e
        errors.add(:updated_by, "#{e}, exactly 'updated_by': #{user_id}")
      end
    end
  end
end
