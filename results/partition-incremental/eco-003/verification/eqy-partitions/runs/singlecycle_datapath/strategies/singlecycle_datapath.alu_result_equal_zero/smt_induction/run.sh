STATUS=ERROR
sby -f singlecycle_datapath.alu_result_equal_zero.sby > /dev/null && STATUS=$(awk '{print $1}' singlecycle_datapath.alu_result_equal_zero/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'singlecycle_datapath.alu_result_equal_zero' using strategy 'smt_induction'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'singlecycle_datapath.alu_result_equal_zero' using strategy 'smt_induction': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'singlecycle_datapath.alu_result_equal_zero' using strategy 'smt_induction': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'singlecycle_datapath.alu_result_equal_zero' using strategy 'smt_induction': timeout"
    ;;
    *)
        cat singlecycle_datapath.alu_result_equal_zero/ERROR 2> /dev/null
        echo "Execution of strategy 'smt_induction' on partition 'singlecycle_datapath.alu_result_equal_zero' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/singlecycle_datapath/strategies/singlecycle_datapath.alu_result_equal_zero/smt_induction/singlecycle_datapath.alu_result_equal_zero/logfile.txt'."
        exit 1
    ;;
esac
exit 0

