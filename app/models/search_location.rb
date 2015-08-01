class SearchLocation < ActiveRecord::Base
  def self.find_using(name)
    where(:name => (name.capitalize + " New York")).first
  end
end
