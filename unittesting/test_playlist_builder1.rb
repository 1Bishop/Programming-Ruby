#---
# Excerpted from "Programming Ruby 3.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/ruby5 for more book information.
#---
require "minitest/autorun"
require_relative "playlist_builder"

class TestPlaylistBuilder < Minitest::Test
  def test_empty_playlist
    database = DBI.new("DBI:mysql:playlists")
    playlist_builder = PlaylistBuilder.new(database)
    assert_empty(playlist_builder.playlist)
    playlist_builder.close
  end

  def test_artist_playlist
    database = DBI.new("DBI:mysql:playlists")
    playlist_builder = PlaylistBuilder.new(database)
    playlist_builder.include_artist("krauss")
    refute_empty(playlist_builder.playlist, "Playlist shouldn't be empty")
    playlist_builder.playlist.each do |entry|
      assert_match(/krauss/i, entry.artist)
    end
    playlist_builder.close
  end

  def test_title_playlist
    database = DBI.new("DBI:mysql:playlists")
    playlist_builder = PlaylistBuilder.new(database)
    playlist_builder.include_title("midnight")
    refute_empty(playlist_builder.playlist, "Playlist shouldn't be empty")
    playlist_builder.playlist.each do |entry|
      assert_match(/midnight/i, entry.title)
    end
    playlist_builder.close
  end

  # ...
end
