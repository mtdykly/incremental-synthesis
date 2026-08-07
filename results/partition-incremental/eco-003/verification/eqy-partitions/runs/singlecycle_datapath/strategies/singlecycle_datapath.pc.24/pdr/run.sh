STATUS=ERROR
sby -f singlecycle_datapath.pc.24.sby > /dev/null && STATUS=$(awk '{print $1}' singlecycle_datapath.pc.24/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'singlecycle_datapath.pc.24' using strategy 'pdr'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'singlecycle_datapath.pc.24' using strategy 'pdr': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'singlecycle_datapath.pc.24' using strategy 'pdr': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'singlecycle_datapath.pc.24' using strategy 'pdr': timeout"
    ;;
    *)
        cat singlecycle_datapath.pc.24/ERROR 2> /dev/null
        echo "Execution of strategy 'pdr' on partition 'singlecycle_datapath.pc.24' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/singlecycle_datapath/strategies/singlecycle_datapath.pc.24/pdr/singlecycle_datapath.pc.24/logfile.txt'."
        exit 1
    ;;
esac
exit 0

