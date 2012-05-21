class CreatePaydayTables < ActiveRecord::Migration
  def self.up
    create_table :<%= options.invoice_name.pluralize.underscore.split("/").last %> do |t|
      # invoices will work without anything but bill_to, but there are quite a few options for the fields you can save, like ship_to
      # due_at, and paid_at
      t.string    :invoice_number
      t.decimal   :shipping_rate
      t.decimal   :tax_rate
      t.string    :currency
      t.timestamp :due_at
      t.timestamp :paid_at
      t.text      :invoice_details
      t.text      :tax_description
      t.text      :shipping_description
      t.text      :notes
      t.text      :heading
      
      t.string    :pdf_document_file_name
      t.integer   :pdf_document_file_size
      t.string    :pdf_document_content_type
      t.string    :pdf_document_updated_at

      t.timestamps
    end

    create_table :<%= options.line_item_name.pluralize.underscore.split("/").last %> do |t|
      t.belongs_to :<%= options.invoice_name.underscore %>

      t.decimal :price
      t.text    :description
      t.decimal :quantity     # can also be :decimal or :float - just needs to be numeric
      t.decimal :display_price
      t.decimal :display_quantity

      t.timestamps
    end
    
    create_table :<%= "#{options.address_name.pluralize}".underscore.split("/").last %> do |t|
      t.string :first_name
      t.string :last_name
      t.string :street1
      t.string :street2
      t.string :zip
      t.string :city
      t.string :country
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :<%= options.invoice_name.pluralize.underscore.split("/").last %>
    drop_table :<%= options.line_item_name.pluralize.underscore.split("/").last %>
    drop_table :<%= options.address_name.pluralize.underscore.split("/").last %>
  end
end