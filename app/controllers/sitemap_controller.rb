class SitemapController < ApplicationController
  caches_page :sitemap
  
  def sitemap
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = 'Thu, 30 Jan 2010 14:47:40 GMT'
  end
  
end
