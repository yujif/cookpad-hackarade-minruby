MY_PROGRAM = 'interp.rb'

Dir.glob('test*.rb').sort.each do |f|
  correct = `ruby #{f}`
  answer = `ruby #{MY_PROGRAM} #{f}`

  puts "#{f} => #{correct == answer ? 'OK!' : 'NG'}"
  break if correct != answer
end