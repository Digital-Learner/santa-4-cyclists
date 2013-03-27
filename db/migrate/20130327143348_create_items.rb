class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :flag, default: false

      t.timestamps
    end
  end
end
