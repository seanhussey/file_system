require 'helper'

class TestFileNode < Test::Unit::TestCase
  def setup
    @fs = FileSystem.root
    @file_node = FileNode.new("readme.txt")
  end
  
  should "have a name" do
    assert_equal "readme.txt", @file_node.name
  end
  
  should "have a full path name" do
    folder = FolderNode.new("tmp")
    folder << @file_node
    @fs << folder
    
    assert_equal "/tmp/readme.txt", @file_node.full_path_name
  end
  
  should "have a full path name when nested within more than one folder" do
    folder1 = FolderNode.new("usr")
    folder2 = FolderNode.new("local")
    folder3 = FolderNode.new("doc")
    @fs << folder1
    folder1 << folder2
    folder2 << folder3
    folder3 << @file_node
    
    assert_equal "/usr/local/doc/readme.txt", @file_node.full_path_name
  end
  
end
