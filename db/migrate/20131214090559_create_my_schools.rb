class CreateMySchools < ActiveRecord::Migration
  def change
    create_table :my_schools do |t|
      t.string :name
      t.string :website_url
      t.string :company_name
      t.string :contact_name
      t.string :email
      t.string :phone_number
      t.string :vat_number
      t.text :address
      t.string :city
      t.string :post_code
      t.string :note
      t.boolean :active

      t.timestamps
    end
  end
end
