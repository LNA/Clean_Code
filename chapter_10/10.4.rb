# A Cohesive Class

class Stack
  def initialize
    @top_of_stack = 0
    @elements = []
  end

  def size
    @top_of_stack
  end

  def push(element)
    @elements << @top_of_stack
  end

  def pop
    if @top_of_stack == 0
      raise "Popped when empty"
    end
    @elements = @elements[0..-2]
  end
end
