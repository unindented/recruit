class CreateCandidates < ActiveRecord::Migration

  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.text   :comments

      t.references :role

      t.timestamps
    end
  end

end
