require 'helper'

class TestFileSystem < Test::Unit::TestCase
  def setup
    @fs = FileSystem.root
  end
  
  should "be the root node of the modeled file system" do
    assert_equal "", @fs.name
  end
end
