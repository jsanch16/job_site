class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description

      t.references :employer, index: true, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
