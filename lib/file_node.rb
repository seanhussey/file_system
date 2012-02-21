class FileNode < Node
  def initialize(name, size = 0)
    super(name, size)
  end
  
  def size
    @size
  end
  
  def folder?
    false
  end
end