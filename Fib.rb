

class Fib

  PHI = (1 + Math.sqrt(5)) / 2
  LOOKUP_TABLE = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811]

  def initialize
  
  end

  def recursive_fib(x)
    if (x == 0) then 
      0
    elsif (x == 1 or x == 2) then
      1
    else 
      recursive_fib(x - 1) + recursive_fib(x - 2)
    end
  end

  def loop_fib(x) 
    if (x == 0) then
      0 
    elsif (x == 1 or x == 2) then
      1
    else
       n1, n2, cur = 1, 1, 0
      (x - 2).times do 
        cur = n1 + n2
        n2, n1 = n1, cur
      end
      cur
    end
  end

  def lookup_table_fib(x)
    if (x < LOOKUP_TABLE.length) then
      LOOKUP_TABLE[x]
    else
      nil
    end
  end

  def closed_form_fib(x)
    ((PHI ** x) / (Math.sqrt(5))).round
  end

  def closed_form_no_rounding_fib(x)
    (((PHI ** x) / (Math.sqrt(5))) + 0.5).floor
  end

  def brute_force_fib(x)
    if (x == 0) then
      0
    elsif (x == 1 or x == 2) then
      1
    else
      cur = 1
      while (true)
        cur += 1
        if (Math.log(((cur * Math.sqrt(5)) + 0.5), PHI).floor == x) then
          return cur
        end
      end
    end
  end

end

# EXECUTION STARTS HERE
FIB_TO_FIND = 10
puts "Fun with Fibonacci"
f = Fib.new

puts f.lookup_table_fib(FIB_TO_FIND)
puts f.closed_form_fib(FIB_TO_FIND)
puts f.closed_form_no_rounding_fib(FIB_TO_FIND)
puts f.brute_force_fib(FIB_TO_FIND)
puts f.loop_fib(FIB_TO_FIND)
puts f.recursive_fib(FIB_TO_FIND)
