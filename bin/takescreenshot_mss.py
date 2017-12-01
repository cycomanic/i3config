#!/usr/bin/python3
from mss import mss
from PIL import Image
import sys
icon = "/home/jschrod/.local/share/icons/screenlock.png"

try:
   fn = sys.argv[1]
except:
    sys.exit("Usage: %s [filename]"%sys.argv[0])

with mss() as screenshoter:
    icn = Image.open(icon, "r")
    img  = screenshoter.grab(screenshoter.monitors[0])
    img2 = Image.frombytes('RGB', img.size, img.rgb)
    img2 = img2.resize((int(img.size[0]/10), int(img.size[1]/10)),Image.BILINEAR)
    img2 = img2.resize(img.size)
    img2 = img2.convert("RGBA")
    mask = Image.merge("L", (icn.split()[3],))
    offsetx = 0
    for mon in screenshoter.monitors[1:]:
            img2.paste(icn, (int(offsetx+ mon['width']/2-icn.size[0]/2),
                            int(mon['height']/2-icn.size[1]/2)), mask)
            offsetx += mon['width']
    img2.save(fn)



