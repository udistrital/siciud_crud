class ApplicationRecord < ActiveRecord::Base
  include Swagger::ErrorSchema

  self.abstract_class = true

  # Tracking
  # https://stackoverflow.com/questions/2933582/rails-migration-t-references-with-alternative-name
  # https://stackoverflow.com/questions/27809342/rails-migration-add-reference-to-table-but-different-column-name-for-foreign-ke
  # https://www.fatlemon.co.uk/2018/08/foreign-keys-to-custom-primary-key-caveats-in-ruby-on-rails/
  # https://dev.to/luchiago/multiple-foreign-keys-for-the-same-model-in-rails-6-7ml
  # https://stackoverflow.com/questions/57532366/how-to-add-foreign-key-in-migration-where-reference-table-has-no-id-column
  belongs_to :user, foreign_key: 'created_by', optional: true
  belongs_to :user, foreign_key: 'updated_by', optional: true

  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
  # belongs_to :created_by, class_name: "User", foreign_key: 'created_by', optional: true
  # belongs_to :updated_by, class_name: "User", foreign_key: 'updated_by', optional: true

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
