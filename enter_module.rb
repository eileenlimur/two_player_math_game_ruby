module Enter
  print "Press Enter"
  input = $stdin.gets.chomp
  if input
    yield
  end
end