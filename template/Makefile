BUILD_DIR = build
TEX_DOC = $(wildcard *.tex)

all: 
	pdflatex \
		-interaction=batchmode \
		-output-directory=$(BUILD_DIR) \
		$(TEX_DOC)

open: all
	nohup zathura \
		--mode fullscreen \
		$(BUILD_DIR)/*.pdf \
		&> /dev/null &

clean:
	rm -rf $(BUILD_DIR)/*
