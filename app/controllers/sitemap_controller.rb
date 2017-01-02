class SitemapController < ApplicationController
  layout nil

  def index
    headers['Content-Type'] = 'application/xml'
    last_listing = Listing.last
    if stale?(:etag => last_listing, :last_modified => last_listing.updated_at.utc)
      respond_to do |format|
        format.xml { @listings = Listing.all }
      end
    end
  end
end