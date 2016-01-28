import sys
import subprocess
import write

proc = subprocess.Popen(["python", "-c", "import writer; writer.write()"], stdout=subprocess.PIPE)
out = proc.communicate()[0]
print out.upper()
