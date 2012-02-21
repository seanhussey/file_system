class Node
  include Comparable
  attr_accessor :name, :parent, :size, :last_modified
  
  def initialize(name, size = 0)
    @name          = name
    @parent        = nil
    @size          = size
    @last_modified = Time.now
  end
  
  def full_path_name
    parent.nil? ? "#{name}" : "#{parent.full_path_name}/#{name}"
  end
  
  def folder?
    true
  end
  
  def <=>(other)
    self.name <=> other.name
  end
  
  def rename(name)
    @name = name
  end
  
  def full_file_list
    if self.folder?
      return [full_path_name, subnodes.collect {|subnode| subnode.full_file_list}].flatten
    else
      return full_path_name
    end
  end
  
end