module ApplicationHelper
  #Returns the full title on a page-per basis
  def full_title(page_title)
    base_title = "Event Map"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def video_frame_id(id)
    base_id = "video"
    "#{base_id}#{id.to_s}"
  end
end
