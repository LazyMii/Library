class AddMoreInformationToBooks < ActiveRecord::Migration
  def change
    add_column :books, :isbn_10, :string
    add_column :books, :isbn_13, :string
    add_column :books, :subtitle, :string
    add_column :books, :authors, :string
    add_column :books, :image_link, :binary
    add_column :books, :published_date, :datetime

  end
end
