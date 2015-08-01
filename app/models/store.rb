class Store < ActiveRecord::Base
  has_many :tests
  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?
  fuzzily_searchable :name

  def self.find_first_fuzzy(name)
    self.find_by_fuzzy_name(name).first
  end

  
  private
    def full_address
      "#{address} #{city} #{state_code} #{postal_code}"
    end
end
