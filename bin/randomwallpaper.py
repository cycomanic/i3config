#!/usr/bin/python3

import glob
from random import choice
from gi.repository import Gdk
import subprocess

display = Gdk.Display.get_default()
nmonitors = display.get_n_monitors()

wallpaperdir = "/home/jschrod/Downloads/Backgrounds/"

pngs = glob.glob(wallpaperdir+"*.png")
jpgs = glob.glob(wallpaperdir+"*.jpg")

bing_pngs =  glob.glob(wallpaperdir+"Bing/*.png")
bing_jpgs =  glob.glob(wallpaperdir+"Bing/*.jpg")

files = pngs + jpgs + bing_pngs + bing_jpgs
options = [ "--bg-scale"]
for mon in range(nmonitors):
    options.append(choice(files))

subprocess.call(["feh"] + options )



