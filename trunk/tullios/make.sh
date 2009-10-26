echo Building CORBA remote interfaces..
idlac -c -s src/RI/RI.idl -o src/RI/
idlj -f all -td src/log/java/ src/log/java/log_viewer.idl

echo Building startup...
gnatmake -P f1sim_startup.gpr 

echo Building Driver...
gnatmake -P f1sim_driver.gpr 

echo Building Circuit...
gnatmake -P f1sim_circuit.gpr 

echo Building Logger...
javac -Xlint:unchecked ./src/log/java/Log_main.java -sourcepath ./src/log/java/ -d obj_logger
