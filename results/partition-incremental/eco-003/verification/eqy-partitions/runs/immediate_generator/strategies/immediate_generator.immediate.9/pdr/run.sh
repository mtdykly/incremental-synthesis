STATUS=ERROR
sby -f immediate_generator.immediate.9.sby > /dev/null && STATUS=$(awk '{print $1}' immediate_generator.immediate.9/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'immediate_generator.immediate.9' using strategy 'pdr'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'immediate_generator.immediate.9' using strategy 'pdr': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'immediate_generator.immediate.9' using strategy 'pdr': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'immediate_generator.immediate.9' using strategy 'pdr': timeout"
    ;;
    *)
        cat immediate_generator.immediate.9/ERROR 2> /dev/null
        echo "Execution of strategy 'pdr' on partition 'immediate_generator.immediate.9' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/immediate_generator/strategies/immediate_generator.immediate.9/pdr/immediate_generator.immediate.9/logfile.txt'."
        exit 1
    ;;
esac
exit 0

