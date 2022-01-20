class CreateDados < ActiveRecord::Migration[6.1]
  def change
    create_table :dados do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :unico

      t.timestamps
    end
  end
end
