require 'helper'

class TestFolderNode < Test::Unit::TestCase
  def setup
    @fs          = FileSystem.root
    @name        = "usr"
    @folder_node = FolderNode.new(@name)
    @fs << @folder_node
  end
  
  should "have a full path name" do
    assert_equal @name, @folder_node.name
  end
  
  context "Folders" do
    should "have a collection of subnodes" do
      assert !@folder_node.subnodes.nil?
      assert_equal 0, @folder_node.subnodes.size
    end
    
    context "that" do
      setup do
        @local = FolderNode.new("local")
      end

      should "be able to be added to" do
        @folder_node << @local
        
        assert_equal 1, @folder_node.subnodes.size
        assert @folder_node.subnodes.include? @local
      end
      
      context "and" do
        should "be able to be deleted from" do
          @folder_node.remove_subnode(@local)
          
          assert_equal 0, @folder_node.subnodes.size
          assert !(@folder_node.subnodes.include? @local)
        end
      end
    end
  end
  
  should "have a full_path_name" do
    assert_equal "/#{@name}", @folder_node.full_path_name
  end
  
  should "have a full_path_name when nested" do
    folder = FolderNode.new("opt")
    @folder_node << folder
    
    assert_equal "/usr/opt", folder.full_path_name
  end
  
  should "be able to be renamed" do
    @folder_node.rename("var")
    
    assert_equal "var", @folder_node.name
    assert_equal "/var", @folder_node.full_path_name
  end
  
  should "sort the subnodes by name" do
    zebra     = FileNode.new("zebra.png")
    apple     = FileNode.new("apple.txt")
    manhattan = FolderNode.new("Manhattan Trip")
    @folder_node << zebra
    @folder_node << apple
    @folder_node << manhattan
    
    # Capital letters sort before lowercase letters
    assert_equal [manhattan, apple, zebra], @folder_node.subnodes
  end
  
  should "be able to create a new folder within itself" do
    @folder_node.create_folder("tmp")
    
    assert_equal 1, @folder_node.subnodes.size
    assert @folder_node.subnodes.first.is_a?(FolderNode)
  end
  
  should "be able to create a new file within itself" do
    @folder_node.create_file("apple.txt", 1024)
    
    assert_equal 1, @folder_node.subnodes.size
    assert @folder_node.subnodes.first.is_a?(FileNode)
  end
end
