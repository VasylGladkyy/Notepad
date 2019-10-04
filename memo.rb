class Memo<Post

  def read_from_console
    puts "Нова замітка (Рахуються всі слова до рядка \"end\"):"
    @text=[]
    line = nil
    while line!="end"do
      line=STDIN.gets.chomp
      @text<<line
    end
    @text.pop
  end

  def to_strings
    time_string="Створено: #{@created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")} \n\r \n\r"
    return @text.unshift(time_string)
  end

end