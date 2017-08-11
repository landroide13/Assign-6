class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :eamil
      t.string :password_digest
      t.string :image_url

      t.timestamps
    end
  end
end
