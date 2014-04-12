class LinkedListItem
  include Comparable

  attr_accessor :new_item, :index
  attr_reader :payload, :next_list_item

  # called by LinkedListItem.new
  def initialize(payload)
    @payload = payload
    @next_list_item = nil
    @last = true
  end

  def next_list_item= new_item
    raise ArgumentError if self === new_item
    @next_list_item = new_item
    # set current list item to false since the new item is now the last item
    @last = false
  end

  def next_list_item 
    @next_list_item
  end

  def last?
    @last 
  end

  def <=> other
    if self.payload.is_a? Numeric
      other.object_id <=> self.object_id
    elsif other.payload.is_a? Numeric
      other.object_id <=> self.object_id
    else
      self.object_id <=> other.object_id
    end
  end

  def === other
    self.object_id === other.object_id
  end

  def == other
    self.class == other.class
  end

end
