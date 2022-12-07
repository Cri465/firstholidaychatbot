class Location < ApplicationRecord
  def tags
    eval self[:tags]
  end

  def geodata
    eval self[:geodata]
  end

end
