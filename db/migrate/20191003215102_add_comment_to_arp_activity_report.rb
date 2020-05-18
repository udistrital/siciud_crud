class AddCommentToArpActivityReport < ActiveRecord::Migration[5.2]
  def change
    add_column :arp_activity_reports, :comment, :text
  end
end
