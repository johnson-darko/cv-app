class CreateResumes < ActiveRecord::Migration[7.0]
  def change
    create_table :resumes do |t|
      t.string :name_user
      t.text :user_info
      t.string :user_interest
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.string :project_name
      t.datetime :project_date_from
      t.datetime :project_date_to
      t.text :project_description
      t.text :project_technologies
      t.string :project_link
      t.string :language_name
      t.string :language_level
      t.text :project_role
      t.datetime :education_date_from
      t.datetime :education_date_to
      t.string :education_location
      t.string :education_level
      t.text :education_description
      t.datetime  :job_date_from
      t.datetime  :job_date_to
      t.string  :job_company
      t.string   :job_location
      t.string  :job_position
      t.string  :skill_title
      t.string   :skill_level
      t.string   :skill_color
      t.string   :github_links
      t.string   :linkdeln_links
      t.string   :twitter_links
      

      t.timestamps
    end
  end
end
