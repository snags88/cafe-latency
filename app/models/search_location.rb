class SearchLocation < ActiveRecord::Base
  def self.find_using(name)
    where(:name => (name + " New York")).first
  end
end
