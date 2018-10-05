require 'minruby'
require 'colorize'
require 'pp'
require 'stringio'

MY_PROGRAM = 'interp.rb'

Dir.glob('test*.rb').sort.each do |f|
  if f == 'test4-4.rb'
    correct = `ruby -r ./fizzbuzz.rb #{f}`
  else
    correct = `ruby #{f}`
  end
  answer = `RUBY_THREAD_VM_STACK_SIZE=400000000 ruby -rminruby #{MY_PROGRAM} #{MY_PROGRAM} #{MY_PROGRAM} #{f}`

  print "#{f} => "
  if correct == answer
    puts "OK!".green
  else
    puts "NG".red

    out = StringIO.new
    PP.pp(minruby_parse(File.read(f)), out)
    out.rewind
    puts out.read.yellow

    exit(1)
  end
end