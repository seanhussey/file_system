file_system
===========

Installation
------------

Clone the repo and run ````bundle```` to install the dependencies. Then run ````rake install```` to install the gem locally.

Usage
-----

    require 'file_system'
    fs = FileSystem.root
    fs.create_folder("var")
    
    usr = FolderNode.new("usr")
    local = FolderNode.new("local")
    doc = FolderNode.new("doc")
    doc << FileNode.new("README.txt", 1024)
    local << doc
    usr << local
    fs << usr
    
    fs.full_file_list
    fs.size
    
    doc.rename("man")
    fs.full_file_list
    

Contributing to file_system
---------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2012 Sean Hussey. See LICENSE.txt for
further details.

