def debug_page( *args, &block )
  it( *args, { driver: :poltergeist_debug, inspector: true }, &block )
end