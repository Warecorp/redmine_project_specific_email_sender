class CreateProjectEmails < ActiveRecord::Migration[5.2]
  def self.up
    create_table :project_emails do |t|
      t.string :email
      t.references :project
    end
    remove_index :project_emails, :project_id #:project_emails, name: "index_project_emails_on_project_id"
    add_index :project_emails, :project_id
  end

  def self.down
    remove_index :project_emails, :project_id
    drop_table :project_emails
  end
end
