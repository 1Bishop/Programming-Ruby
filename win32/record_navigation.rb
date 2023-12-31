#---
# Excerpted from "Programming Ruby 3.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/ruby5 for more book information.
#---
require "win32ole"

urls_visited = []
running = true

def default_handler(event, *args)
  return unless event === "BeforeNavigate"
  puts "Now Navigating to #{args[0]}..."
end

ie = WIN32OLE.new("InternetExplorer.Application")
ie.visible = true
ie.gohome
ev = WIN32OLE_EVENT.new(ie, "DWebBrowserEvents")

ev.on_event { |*args| default_handler(*args) }
ev.on_event("NavigateComplete") { |url| urls_visited << url }
ev.on_event("Quit") do |*_args|
  puts "IE has quit"
  puts "You Navigated to the following URLs: "
  urls_visited.each_with_index do |url, i|
    puts "(#{i + 1}) #{url}"
  end
  running = false
end

# hang around processing messages
WIN32OLE_EVENT.message_loop while running
