SRC = src/
EXEC = main

defualt:
	build

run:
	moon $(SRC)/$(EXEC).moon

start:
	cd $(SRC) && lapis server

build:
	moonc src/
# 	Build
# moonc -t .built/ src/
# mkdir built/
# mv .built/src/* built/
# rm -rf .built
# cp src/{mime.types,nginx.conf} built/

clean:
	rm -rf .built
	rm -rf built

test:
	build
	busted

watch:
	moonc -w $(SRC)

lint:
	moonc -l $(SRC)

count:
	wc -l $$(git ls-files | grep 'moon$$') | sort -n | tail