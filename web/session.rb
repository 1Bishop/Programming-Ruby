#---
# Excerpted from "Programming Ruby 3.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/ruby5 for more book information.
#---
require 'cgi'
require 'cgi/session'

cgi = CGI.new("html4")
sess = CGI::Session.new(cgi, "session_key" => "rubyweb",
                             "prefix"      => "web-session.")

if sess['lastaccess']
  msg = "<p>You were last here #{sess['lastaccess']}.</p>"
else
  msg = "<p>Looks like you haven't been here for a while</p>"
end

count = (sess["accesscount"] || 0).to_i
count += 1

msg << "<p>Number of visits: #{count}</p>"

sess["accesscount"] = count
sess["lastaccess"]  = Time.now.to_s
sess.close

cgi.out { 
  cgi.html { 
    cgi.body {
      msg 
    }
  }
}

