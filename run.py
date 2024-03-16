import os
import subprocess
import sys

homepath = (sys.argv[0])
homebasename = os.path.basename(homepath)
homepath = homepath.replace(homebasename,"")

bdpath = os.path.join(homepath, "BlackDragoN.jar")
javapath = os.path.join(homepath, "jre-1.8", "bin", "java").replace("\\", "/")

subprocess.run([javapath, "-jar", bdpath])