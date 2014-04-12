require 'linked_list_item'

class LinkedList
  attr_accessor :size, :last, :val

  def initialize label = nil
    @label = label
    @head = nil
    @tail = nil
    @last = nil
    @size = 0
  end

  def to_s
    if @head == nil 
      val = "| |"
    else
      @size.times do

        val = "| #{@head.payload} |"

      end
    end
      val
  end

  def add_item payload
    item = LinkedListItem.new(payload)
    if @head == nil
      @head = item
      @tail = item
    else
      @tail.next_list_item = item
      @tail = item
      @last = item.payload
    end
    @size = size + 1
  end

  def get num
    raise IndexError if num < 0 

    if num == 0
      raise IndexError if @head == nil
      item = @head.payload
    elsif num == 1
      raise IndexError if @head == nil
      item = @head.next_list_item.payload
    elsif num > 1
      num -= 1
      raise IndexError if @head == nil
      next_item = @head.next_list_item
      num.times do
        raise IndexError if next_item == nil
        item = next_item.next_list_item
      end
      item = item.payload
    end
    item
  end

end
