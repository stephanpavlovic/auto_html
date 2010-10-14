require 'rubygems'
gem 'soundcloud-ruby-api-wrapper'
require 'soundcloud'

AutoHtml.add_filter(:soundcloud).with(:width => 500, :height => 81) do |text,options|
  text.gsub(/http:\/\/soundcloud\.com.*\/.+\/(.+)_*/) do
    id = $1
    sc_client = Soundcloud.register({:consumer_key => 'N8JIR8pzRWZ749BFhb6xg'})
    track = sc_client.Track.find(:first,:params => {"q" => id})
    %{<object height="81" width="500"><param name="movie" value="http://player.soundcloud.com/player.swf?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F#{track.id}&amp;show_comments=false&amp;auto_play=false&amp;color=ff7700"></param> <param name="allowscriptaccess" value="always"></param> <embed allowscriptaccess="always" height="81" src="http://player.soundcloud.com/player.swf?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F#{track.id}&amp;show_comments=true&amp;auto_play=false&amp;color=ff7700" type="application/x-shockwave-flash" width="500"></embed> </object>}
  end
end