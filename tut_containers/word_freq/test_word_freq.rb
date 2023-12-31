#---
# Excerpted from "Programming Ruby 3.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/ruby5 for more book information.
#---
require "minitest/autorun"

class TestSongList < Minitest::Test
  def test_delete
    list = SongList.new
    s1 = Song.new("title1", "artist1", 1)
    s2 = Song.new("title2", "artist2", 2)
    s3 = Song.new("title3", "artist3", 3)
    s4 = Song.new("title4", "artist4", 4)

    list.append(s1).append(s2).append(s3).append(s4)

    assert_equal(s1, list[0])
    assert_equal(s3, list[2])
    assert_nil(list[9])

    assert_equal(s1, list.delete_first)
    assert_equal(s2, list.delete_first)
    assert_equal(s4, list.delete_last)
    assert_equal(s3, list.delete_last)
    assert_nil(list.delete_last)
  end
end

