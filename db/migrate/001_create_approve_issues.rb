class CreateApproveIssues < ActiveRecord::Migration[5.2]
  def self.up
    create_table :approve_issues do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :issue_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.integer :approval
    end
    # add_index :approve_issues, [:issue_id, :user_id], unique: true
  end

  def self.down
    drop_table :approve_issues
  end
end
