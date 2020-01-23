#force_cmake_rebuild.py

import glob
import os, sys
import random

# regenerate cmake file from
current_path = os.path.dirname(sys.argv[0])
join_path = os.path.join( current_path,"force_cmake_rebuild.cmake" )
print( "os.path.dirName:",current_path )
print( "open this join_path to write:",join_path )
fo = open( join_path, "w+") # w+ to overwrite old file while running

str = "# " + str(random.random())
print("random str:",str)
fo.write( "# write some random content here everytime to make CMakeFiles rebuild everytime.\n")
fo.write( str + "\n")

fo.close()
