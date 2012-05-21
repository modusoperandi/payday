class <%= options.address_name.singularize %> < ActiveRecord::Base
  
  belongs_to :<%= "#{options.invoice_name.pluralize}".underscore %>, :as => :billing_address
  belongs_to :<%= "#{options.invoice_name.pluralize}".underscore %>, :as => :shipping_address
  belongs_to :<%= "#{options.invoice_name.pluralize}".underscore %>, :as => :invoicing_party_address
  
  attr_accessor :first_name, :last_name, :street1, :street2, :zip, :city, :country
  validates     :first_name, :last_name, :street1, :zip, :city, :country, :presence => true
end