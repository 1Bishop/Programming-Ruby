#---
# Excerpted from "Programming Ruby 3.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/ruby5 for more book information.
#---
Note = Struct.new(:value) do
  def to_s
    value.to_s
  end
end

class Chord
  def initialize(arr)
    @arr = arr
  end

  def play
    @arr.join("-")
  end
end

c = Chord.new(
  [
    Note.new("G"),
    Note.new("Bb"),
    Note.new("Db"),
    Note.new("E")
  ]
)

File.open("posterity", "w+") do |f|
  Marshal.dump(c, f)
end
