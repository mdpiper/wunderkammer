# Make a QR code from an URL.
# pip install qrcode pillow

import qrcode


url = "https://bmi.readthedocs.io"

qr = qrcode.QRCode(version=1, box_size=10, border=5)
qr.add_data(url)
qr.make(fit=True)
img = qr.make_image(fill="black", back_color="white")
img.save("bmi-documentation-qr-code.png")
