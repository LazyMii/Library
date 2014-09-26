class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :isbn
      t.string :title
      t.string :publisher
      t.string :text
      t.string :name

      t.timestamps
    end
  end
end
