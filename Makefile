WEB_ASSETS := index.html manifest.webmanifest sw.js icon-192.png icon-512.png

.PHONY: all
all: $(WEB_ASSETS)
	mkdir -p public
	cp $^ public/
