STATUS=ERROR
sby -f data_memory_interface.read_data.20.sby > /dev/null && STATUS=$(awk '{print $1}' data_memory_interface.read_data.20/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'data_memory_interface.read_data.20' using strategy 'smt_induction'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'data_memory_interface.read_data.20' using strategy 'smt_induction': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'data_memory_interface.read_data.20' using strategy 'smt_induction': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'data_memory_interface.read_data.20' using strategy 'smt_induction': timeout"
    ;;
    *)
        cat data_memory_interface.read_data.20/ERROR 2> /dev/null
        echo "Execution of strategy 'smt_induction' on partition 'data_memory_interface.read_data.20' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/data_memory_interface/strategies/data_memory_interface.read_data.20/smt_induction/data_memory_interface.read_data.20/logfile.txt'."
        exit 1
    ;;
esac
exit 0

