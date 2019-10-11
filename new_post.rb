require_relative 'lib/post.rb'
require_relative 'lib/link.rb'
require_relative 'lib/memo.rb'
require_relative 'lib/task.rb'

puts "Привіт, я твій блокнот!"
puts "Що хочете записати в блокнот?"

сhoices=Post.new_post.keys

choice=-1

until choice>=0 && choice<сhoices.size
  сhoices.each_with_index { |type,index | puts "\t#{index}. #{type}" }
  choice=STDIN.gets.to_i
end

entry=Post.create(сhoices[choice])

entry.read_from_console
id=entry.save_to_db

puts "Запис збережено!, id=#{id}"