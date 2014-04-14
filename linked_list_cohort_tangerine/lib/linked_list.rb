class LinkedList
  attr_reader :size

  def initialize *payloads
    @size = 0
    payloads.each { |item| add_item item  }
  end

  def add_item(payload)
    lli = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = lli
    else
      item = @first_item
      until item.last?
        item = item.next_list_item
      end
      item.next_list_item = lli
    end
    @size += 1
  end

  def get(i)
    raise IndexError if i < 0 or i >= size
    item = @first_item
    i.times do
      item = item.next_list_item
    end
    item.payload
  end

  def last
    if size == 0
      nil
    else
      get(size - 1)
    end
  end

  def to_s
    result = "|"
    item = @first_item
    until item.nil?
      result << " " + item.payload.to_s
      result << "," unless item.last?
      item = item.next_list_item
    end
    result + " |"
  end

  def [] num
    get num
  end

  def []=(index, new_payload)
    if index == 0
      item = @first_item
      item.payload = new_payload
    elsif index == 1
      item = @first_item.next_list_item
      item.payload = new_payload
    elsif index > 1
      index -= 1
      next_item = @first_item.next_list_item
      index.times do
        item = next_item.next_list_item
      end
      item.payload = new_payload
    end
  end

  def size
    @size = 0
    return @size if @first_item.nil?
    current_item = @first_item
    until current_item.nil?
      @size += 1
      current_item = current_item.next_list_item
    end
    @size
  end

  def remove index
    current_node = @first_item
    if index == 0
      raise IndexError if current_node == nil 
      @first_item = current_node.next_list_item
    else
    index -= 1
      index.times do
        current_node = current_node.next_list_item
      end
    end
    raise IndexError if current_node == nil 
    current_node.next_list_item = current_node.next_list_item.next_list_item
  end

  def indexOf payload
    index = 0
    current_item = @first_item
    return nil if @first_item.nil?
    while current_item
      return index if current_item.payload == payload
      return if current_item.next_list_item.nil?
      index += 1 
      current_item = current_item.next_list_item
    end
  end

  def sorted?
    return true if @first_item == nil
      current_node = @first_item
      until @size == 1 
        return false if current_node > current_node.next_list_item
        @size -= 1
        current_node = current_node.next_list_item
      end
    true
  end

end

