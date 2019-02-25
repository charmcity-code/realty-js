module ListingsHelper

  # convert Ruby date into human readable local date
  def localdate(listing)
    local_time(listing.created_at, '%b %d, %Y')
  end
end
