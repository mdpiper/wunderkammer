# Make a QR code from an URL.
# pip install qrcode pillow

import qrcode
from qrcode.image.styledpil import StyledPilImage

URL = "https://csdms.colorado.edu/wiki/JupyterHub"
IMAGE_PATH = "./assets/csdms-logo-bars.png"

qr = qrcode.QRCode(error_correction=qrcode.constants.ERROR_CORRECT_H)
qr.add_data(URL)
img = qr.make_image(image_factory=StyledPilImage, embedded_image_path=IMAGE_PATH)

img.save("earthscapehub-qr-code.png")
