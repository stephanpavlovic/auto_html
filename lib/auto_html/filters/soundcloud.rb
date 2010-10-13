require 'rubygems'
gem 'soundcloud-ruby-api-wrapper'
require 'soundcloud'

AutoHtml.add_filter(:soundcloud).with(:width => 500, :height => 81) do |text|
  ActionView::Base.new.auto_link(text, :html => options, :sanitize => false)
end