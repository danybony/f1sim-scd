function launchDrivers() {
	NUMROWS=`wc --lines txt/drivers.txt | egrep -o '[0-9]*'`
	let NUMDRIVERS=($NUMROWS-8)/8
	for i in $(seq 1 $NUMDRIVERS); 
	do 
		eval "obj_driver/main_driver ${i}&"; 
	done
}

po_cos_naming -file txt/ior.txt &

sleep 1

xterm -T "logger" -e "java -cp obj_logger/ Log_main" &

xterm -T "circuit" -e "obj_circuit/main_circuit" &

launchDrivers 

xterm -T "main" -e "obj_startup/main_startup" &
