import os
import re
from os.path import expanduser

dir = expanduser('~') + '/Downloads/themes/icons/'

for filename in os.listdir(dir):
    exp = '.*\.(zip|tar\.(gz|xz))$'
    s = re.search(exp ,filename)
    if s:
        #print("sudo tar --extract --file " + dir + "/" + filename)
        os.system("sudo tar --extract --file " + dir + "/" + filename)