STATUS=ERROR
sby -f riscv_core.singlecycle_datapath.regfile.register.9.10.sby > /dev/null && STATUS=$(awk '{print $1}' riscv_core.singlecycle_datapath.regfile.register.9.10/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'riscv_core.singlecycle_datapath.regfile.register.9.10' using strategy 'pdr'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'riscv_core.singlecycle_datapath.regfile.register.9.10' using strategy 'pdr': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'riscv_core.singlecycle_datapath.regfile.register.9.10' using strategy 'pdr': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'riscv_core.singlecycle_datapath.regfile.register.9.10' using strategy 'pdr': timeout"
    ;;
    *)
        cat riscv_core.singlecycle_datapath.regfile.register.9.10/ERROR 2> /dev/null
        echo "Execution of strategy 'pdr' on partition 'riscv_core.singlecycle_datapath.regfile.register.9.10' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-001/verification/eqy-incremental-vs-full-new/work/strategies/riscv_core.singlecycle_datapath.regfile.register.9.10/pdr/riscv_core.singlecycle_datapath.regfile.register.9.10/logfile.txt'."
        exit 1
    ;;
esac
exit 0

