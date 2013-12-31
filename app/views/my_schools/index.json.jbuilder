json.array!(@my_schools) do |my_school|
  json.extract! my_school, :id, :name, :website_url, :company_name, :contact_name, :email, :phone_number, :vat_number, :address, :city, :post_code, :note, :active
  json.url my_school_url(my_school, format: :json)
end
