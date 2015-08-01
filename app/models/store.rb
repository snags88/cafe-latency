class Store < ActiveRecord::Base
  has_many :tests
  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?
  fuzzily_searchable :name
  
  private
    def full_address
      "#{address} #{city} #{state_code} #{postal_code}"
    end
end
