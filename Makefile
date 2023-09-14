DIRS = $(wildcard */)


all:
	./.new-app.sh


app:
	./.applied.sh

rej:
	./.rejected.sh

clean:
	for dir in $(DIRS); do \
		make -C $$dir clean; \
	done
