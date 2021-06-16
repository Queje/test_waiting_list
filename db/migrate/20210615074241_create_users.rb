class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :waiting_status
      t.datetime :confirmation_date

      t.timestamps
    end
  end
end
