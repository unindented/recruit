class CreateRoles < ActiveRecord::Migration

  def change
    create_table :roles do |t|
      t.string  :name
      t.boolean :enabled, default: true

      t.timestamps
    end
  end

end
