class Test < ActiveRecord::Base
  belongs_to :store

  validates_presence_of :download, :upload, :latency #=> Add store to this list
end
