################################################################################
# Susy grids in Compass
################################################################################
require 'susy'

################################################################################
# Syntax highlighting in markdown
################################################################################
require 'rack/codehighlighter'
require "pygments"

use Rack::Codehighlighter, 
  :pygments,
  :element => "pre>code",
  :pattern => /\A:::([-_+\w]+)\s*\n/,
  :markdown => true

################################################################################
# CoffeeScript filters in Haml
################################################################################
require 'coffee-filter'

################################################################################
# Blog
################################################################################
activate :blog do |blog|
  blog.permalink = "blog/:year/:title.html"
  blog.sources = "blog/:year/:title.html"
end

page "/feed.xml", :layout => false

################################################################################
# Localization (i18n)
################################################################################
activate :i18n, :langs => [:de]

################################################################################
# View Helpers
# Methods defined in the helpers block are available in templates
################################################################################

helpers do
  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end
end

################################################################################
# Build-specific configuration
################################################################################

configure :build do
  # Minify CSS on build
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Compress PNGs, jpgs .. after build
  require "middleman-smusher"
  
  activate :smusher
  
end