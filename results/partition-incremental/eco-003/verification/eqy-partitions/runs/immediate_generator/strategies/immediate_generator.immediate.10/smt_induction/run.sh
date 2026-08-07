STATUS=ERROR
sby -f immediate_generator.immediate.10.sby > /dev/null && STATUS=$(awk '{print $1}' immediate_generator.immediate.10/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'immediate_generator.immediate.10' using strategy 'smt_induction'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'immediate_generator.immediate.10' using strategy 'smt_induction': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'immediate_generator.immediate.10' using strategy 'smt_induction': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'immediate_generator.immediate.10' using strategy 'smt_induction': timeout"
    ;;
    *)
        cat immediate_generator.immediate.10/ERROR 2> /dev/null
        echo "Execution of strategy 'smt_induction' on partition 'immediate_generator.immediate.10' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/immediate_generator/strategies/immediate_generator.immediate.10/smt_induction/immediate_generator.immediate.10/logfile.txt'."
        exit 1
    ;;
esac
exit 0

