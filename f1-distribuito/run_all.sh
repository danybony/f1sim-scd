po_cos_naming -file txt/ior.txt&
java -cp obj_logger/ Log_main&
sleep 2s
obj_circuit/main_circuit&
obj_driver/main_driver 1&
sleep 1s
obj_driver/main_driver 2&
sleep 1s
obj_driver/main_driver 3&
sleep 1s
obj_driver/main_driver 4&
sleep 1s
obj_startup/main_startup