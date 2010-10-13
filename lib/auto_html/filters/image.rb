AutoHtml.add_filter(:image).with(:width => 480, :height => 360) do |text, options|
  text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    %|<img src="#{match}" alt="" width="#{options[:width]}" height="#{options[:height]}/>|
  end
end