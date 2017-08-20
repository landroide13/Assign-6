class CreateComents < ActiveRecord::Migration[5.1]
  def change
    create_table :coments do |t|
      t.text :body

      t.timestamps
    end
  end
end
