echo Building startup..
gnatmake -P f1sim_startup.gpr -d `polyorb-config`

echo Building Driver..
gnatmake -P f1sim_driver.gpr -d `polyorb-config`

echo Building Circuit..
gnatmake -P f1sim_circuit.gpr -d `polyorb-config`
