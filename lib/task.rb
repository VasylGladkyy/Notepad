require 'date'

class Task<Post
  def initialize
    super
    @due_date=Time.now
  end

  def read_from_console
    puts "Що портрібно зробити?"
    @text=STDIN.gets.chomp
    puts "До якого числа треба зробити? (Будь ласка вкажіть дату в форматі ДД.ММ.РРРР"
    input=STDIN.gets.chomp
    @due_date=Date.parse input
  end

  def to_strings
    time_string="Створено: #{@created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")} \n\r \n\r"
    deadline="Крайній термін: #{@due_date}"
    return [deadline,@text,time_string]
  end

  def to_db_hash
    return super.merge(
                    {
                        'text'=>@text,
                        'due_date'=>@due_date.to_s
                    }
    )
  end

  def load_data(data_hash)
    super(data_hash)
    @due_date=Time.parse(data_hash['created_at'])
  end
end