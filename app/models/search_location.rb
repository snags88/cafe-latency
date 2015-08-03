class SearchLocation < ActiveRecord::Base
  def self.find_using(name)
    capitalized_name = name.split(" ").collect(&:capitalize).join(" ")
    where(:name => (capitalized_name + " New York")).first
  end
end
