module AppointmentsHelper

  def buyer_id_field(appointment)
    # select buyer if not using nested route to make appointment
    if appointment.buyer.nil?
      select_tag "appointment[buyer_id]",
      content_tag(:option,'Select Buyer',:value=>"")+options_from_collection_for_select(Buyer.all, :id, :name)
    else
      # get buyer_id from nested route
      hidden_field_tag "appointment[buyer_id]", appointment.buyer_id
    end
  end

  # convert Ruby date into human readable date
  def parsed_date(appointment)
    appointment.date.strftime('%b %d, %Y')
  end

  # convert Ruby time into human readable local time
  def localtime(appointment)
    local_time(appointment.date, '%l:%M %p')
  end
end
