class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :isbn
      t.binary :file

      t.timestamps
    end
  end
end
