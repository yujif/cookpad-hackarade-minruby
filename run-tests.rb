MY_PROGRAM = 'interp.rb'

Dir.glob('test*.rb').sort.each do |f|
  correct = `ruby #{f}`
  answer = `ruby #{MY_PROGRAM} #{f}`

  puts "#{f} => #{correct == answer ? 'OK!' : 'NG'}"
  if correct != answer
    File.foreach(f){|line|
      p line.chomp
    }
    break
  end
end