class FolderNode < Node
  attr_reader :subnodes
  
  def initialize(name)
    super(name, 0)
    @subnodes = []
  end
  
  def <<(node)
    @subnodes << node
    node.parent = self
  end
  
  def remove_subnode(node)
    @subnodes.delete(node)
    node.parent = nil
  end
  
  def subnodes
    @subnodes.sort
  end
  
  def size
    folder_size = 0
    subnodes.each {|subnode| folder_size += subnode.size}
    folder_size
  end
  
  def create_folder(name)
    folder = FolderNode.new(name)
    self << folder
  end
  
  def create_file(name, size = 0)
    new_file = FileNode.new(name, size)
    self << new_file
  end
  
  def local_file_list
    files = subnodes.collect {|subnode| subnode.name}
  end
  
  def folder?
    true
  end
end