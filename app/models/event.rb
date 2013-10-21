class Event < ActiveRecord::Base
  acts_as_gmappable

  validates(:address, presence: true)
  validates(:gmaps, presence: true)
  validates(:latitude, presence: true)
  validates(:longitude, presence: true)
  validates(:name, presence: true)
  validates(:alert, presence: true)


  def gmaps4rails_address
    address
  end

  def gmaps4rails_address
    address
  end

  def gmaps4rails_infowindow
    "<h1>#{name}</h1>"
  end

  def gmaps4rails_marker_picture
    if alert == 0
    {
        "rich_marker" =>  "<div style='padding 2px; background: #f00'><i class='icon-exclamation-sign'></div>"
    }
    else
    {
        "rich_marker" =>  "<div style='padding 2px; background: #0f0'><i class='icon-exclamation-sign'></div>"
    }
    end
  end

end
