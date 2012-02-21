$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'node'
require 'file_node'
require 'folder_node'

module FileSystem
  def self.root
    FolderNode.new("")
  end
end