class AddUserIdToResumes < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :user_id, :integer
  end
end
