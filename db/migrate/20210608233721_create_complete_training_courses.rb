class CreateCompleteTrainingCourses < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_training_courses
  end
end
