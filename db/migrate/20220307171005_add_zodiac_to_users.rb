class AddZodiacToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zodiac, :string
  end
end
