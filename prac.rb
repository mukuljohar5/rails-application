$a = { "a" => 1, "b" => 2, "c" => 3 }
$b = [1, 2, 3]
$c = [5, 7, 8, 12, 15, 89, 56, 561]
$d = "heheh"

class MoreFunctionality
  def add_numbers(numbers)
    flag = false
    if numbers.class == Array
      @sum = numbers.sum
      extra_text(numbers, flag)
    elsif numbers.class == Hash
      flag = true
      @sum = numbers.values.sum
      extra_text(numbers.values, flag)
    else
      raise "WTF dude its not an array or hash how can i add it"
    end
  end

  def extra_text(num_arr, flag)
    text = ""
    num_arr.each_with_index do |num, i|
      if i == (num_arr.length - 1)
        text += "#{num}"
      else
        text += "#{num}, "
      end
    end
    text_new = "The sum off #{text} is #{@sum}"
    final_text = flag ? text_new + "\nWARNING: It was a Hash we added only values" : text_new
    return final_text
  end
end

class Functionality < MoreFunctionality
  def do_something
    puts add_numbers($d)
  end
end

create_obj = Functionality.new
create_obj.do_something
