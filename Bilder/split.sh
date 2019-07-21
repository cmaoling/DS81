#!/bin/bash
echo "Splitting pricture $1.jpg into three pictures (left-middle-right) with 2560x1440 each"
convert -crop 2560x1440+0+0 $1.jpg $1.left.jpg
convert -crop 2560x1440+2561+0 $1.jpg $1.middle.jpg
convert -crop 2560x1440+5121+0 $1.jpg $1.right.jpg
echo "Done."

