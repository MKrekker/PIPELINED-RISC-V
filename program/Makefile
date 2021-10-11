
# default target to run when make is called without args
help:
	$(info make help     - show this message (default))
	$(info make clean    - delete folder with simulation data)
	$(info make rars     - run RISC-V CPU simulator)
	$(info make build    - create .hex program image)
	@true

# common targets

# make clean
#  delete all compilation products & folder with simulation data
clean:
	rm -f  *.hex

# make rars
#  java -jar ./rars.jar & - run rars.jar application using java machine
#									   in background
RARS = java -jar ./rars.jar
rars:
	$(RARS) &

#########################################################
# software build
build: program.hex

# make program.hex - compile to hex memory image using RARS
# java -jar ./rars.jar nc a dump .text HexText program.hex main.S
# java -jar ./rars.jar - run rars.jar application using java machine
# nc                              - copyright notice will not be displayed
# a                               - assemble only, do not simulate
# dump .text HexText program.hex  - dump segment .text to program.hex file in HexText format
program.hex: popcount.S
	$(RARS)  nc a dump .text HexText program.hex popcount.S


