STATUS=ERROR
sby -f singlecycle_datapath.regfile.register.20.5.sby > /dev/null && STATUS=$(awk '{print $1}' singlecycle_datapath.regfile.register.20.5/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'singlecycle_datapath.regfile.register.20.5' using strategy 'smt_induction'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'singlecycle_datapath.regfile.register.20.5' using strategy 'smt_induction': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'singlecycle_datapath.regfile.register.20.5' using strategy 'smt_induction': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'singlecycle_datapath.regfile.register.20.5' using strategy 'smt_induction': timeout"
    ;;
    *)
        cat singlecycle_datapath.regfile.register.20.5/ERROR 2> /dev/null
        echo "Execution of strategy 'smt_induction' on partition 'singlecycle_datapath.regfile.register.20.5' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/singlecycle_datapath/strategies/singlecycle_datapath.regfile.register.20.5/smt_induction/singlecycle_datapath.regfile.register.20.5/logfile.txt'."
        exit 1
    ;;
esac
exit 0

