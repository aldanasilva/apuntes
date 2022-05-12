import logging, os

logging.basicConfig(
    filename='upgrade-ubuntu.log',
    format='%(asctime)s: %(name)s: %(levelname)s %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S',
    level=logging.INFO
)

try:
    os.system('apt-get update')
    os.system('apt-get upgrade -y')
    os.system('apt-get autoremove -y')
    logging.info('Ubuntu is up to date!')
except:
    logging.error("Ubuntu could not be upgraded!")
