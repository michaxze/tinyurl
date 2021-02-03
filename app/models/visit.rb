class Visit < ApplicationRecord
  belongs_to :link

  validates_presence_of :ip_address
end
