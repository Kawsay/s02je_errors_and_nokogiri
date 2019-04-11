begin
  1 + nil
rescue Errno::StandardError => e
  puts e.message
  puts ''
  puts e.full_message
  puts ''
  puts e.backtrace
  puts ''
  puts e.backtrace_locations
  puts ''
  puts e.cause
  puts ''
  puts e.inspect
  puts ''
  puts e.exception
end
puts 'g continué'