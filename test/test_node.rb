require 'helper'

class TestNode < Test::Unit::TestCase
  def setup
    @fs   = FileSystem.root
    @node = Node.new("usr")
    @fs << @node
  end
  
  should "have a name" do
    assert_equal "usr", @node.name
  end
  
  should "have a full path name" do
    assert_equal "/usr", @node.full_path_name
  end
  
  context "Folders" do
    setup do
      @folder_node = FolderNode.new("usr")
      @zebra       = FileNode.new("zebra.png", 512000)
      @apple       = FileNode.new("apple.txt", 1024)
      @folder_node << @zebra
      @folder_node << @apple
    end
    
    context "with no subfolders" do
      should "calculate the size for the enclosed files (single level depth)" do
        assert_equal (@zebra.size + @apple.size), @folder_node.size
      end
    end
    
    context "with subfolders" do
      setup do
        @trips     = FolderNode.new("Trips")
        @manhattan = FileNode.new("Manhattan_Trip.txt", 10240)
        @trips << @manhattan
        @folder_node << @trips
      end

      should "calculate the size for the enclosed file tree (multiple level depth)" do
        assert_equal (@zebra.size + @apple.size + @manhattan.size), @folder_node.size
        assert_equal (@zebra.size + @apple.size + @trips.size), @folder_node.size
      end
      
      should "produce a full file list with full paths" do
        assert_equal 5, @folder_node.full_file_list.size
        assert @folder_node.full_file_list.include?(@zebra.full_path_name)
        assert @folder_node.full_file_list.include?(@apple.full_path_name)
        assert @folder_node.full_file_list.include?(@manhattan.full_path_name)
        assert @folder_node.full_file_list.include?(@trips.full_path_name)
        assert @folder_node.full_file_list.include?(@folder_node.full_path_name)
      end
    end
  end
  
end
