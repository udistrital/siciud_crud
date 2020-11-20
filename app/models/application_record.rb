class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Tracking
  # https://stackoverflow.com/questions/2933582/rails-migration-t-references-with-alternative-name
  # https://stackoverflow.com/questions/27809342/rails-migration-add-reference-to-table-but-different-column-name-for-foreign-ke
  # https://www.fatlemon.co.uk/2018/08/foreign-keys-to-custom-primary-key-caveats-in-ruby-on-rails/
  # https://dev.to/luchiago/multiple-foreign-keys-for-the-same-model-in-rails-6-7ml
  # https://stackoverflow.com/questions/57532366/how-to-add-foreign-key-in-migration-where-reference-table-has-no-id-column
  # belongs_to :user, foreign_key: 'created_by', optional: true
  # belongs_to :user, foreign_key: 'updated_by', optional: true
  belongs_to :created_by, class_name: "User", foreign_key: 'created_by', optional: true
  belongs_to :updated_by, class_name: "User", foreign_key: 'updated_by', optional: true
end
