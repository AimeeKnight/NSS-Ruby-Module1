class List
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def add_to_head entry_obj
    if @head == nil 
      @head = entry_obj
      @tail = entry_obj
    else
      # set passed Entry's 'next' property to the current head
      # shifting the current head one index right
      entry_obj.next = @head
      # reassign the List head to the passed Entry
      @head = entry_obj
    end
  end

  def add_to_tail entry_obj
    if @head == nil 
      @head = entry_obj
      @tail = entry_obj
    else
      # add the passed entry to the end by appending 
      # the object to the tail.next object position
      @tail.next = entry_obj
      # reassign the tail to the passed entry
      @tail = entry_obj
    end

  def remove_head
    unless @head == nil
      removed_head = @head
      @head = head.next
      removed_head
    end
  end

end

class Entry
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end

end
