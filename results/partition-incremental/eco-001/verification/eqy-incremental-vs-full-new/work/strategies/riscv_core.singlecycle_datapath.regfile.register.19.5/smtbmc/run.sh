STATUS=ERROR
sby -f riscv_core.singlecycle_datapath.regfile.register.19.5.sby > /dev/null && STATUS=$(awk '{print $1}' riscv_core.singlecycle_datapath.regfile.register.19.5/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'riscv_core.singlecycle_datapath.regfile.register.19.5' using strategy 'smtbmc'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'riscv_core.singlecycle_datapath.regfile.register.19.5' using strategy 'smtbmc': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'riscv_core.singlecycle_datapath.regfile.register.19.5' using strategy 'smtbmc': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'riscv_core.singlecycle_datapath.regfile.register.19.5' using strategy 'smtbmc': timeout"
    ;;
    *)
        cat riscv_core.singlecycle_datapath.regfile.register.19.5/ERROR 2> /dev/null
        echo "Execution of strategy 'smtbmc' on partition 'riscv_core.singlecycle_datapath.regfile.register.19.5' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-001/verification/eqy-incremental-vs-full-new/work/strategies/riscv_core.singlecycle_datapath.regfile.register.19.5/smtbmc/riscv_core.singlecycle_datapath.regfile.register.19.5/logfile.txt'."
        exit 1
    ;;
esac
exit 0

