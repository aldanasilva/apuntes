import logging, os

logging.basicConfig(
    filename='upgrade-fedora.log',
    format='%(asctime)s: %(name)s: %(levelname)s %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S',
    level=logging.INFO
)

try:
    os.system('dnf check-update')
    os.system('dnf upgrade -y')
    logging.info('Fedora is up to date!')
except:
    logging.error("Fedora could not be upgraded!")
