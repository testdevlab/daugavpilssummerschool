start = Time.now # save starting time of this script

@threads = [] # array where we'll save the created Thread objects
@threads << Thread.new { # create new thread, master thread continues work after this block
  10.times do
    print "cycle ONE\n"
    sleep(0.1)
  end
}

@threads << Thread.new { # create new thread, master thread continues work after this block
  10.times do
    print "cycle TWO\n"
    sleep(0.1)
  end
}

print "cycle THREE\n"

@threads.each(&:join) # master thread waits for all other threads to finish

print "This took: #{Time.now - start} seconds\n" # print out time difference between now and "start" (AKA how much time it took)
