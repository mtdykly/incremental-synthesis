STATUS=ERROR
sby -f instruction_decoder.inst_rd.1.sby > /dev/null && STATUS=$(awk '{print $1}' instruction_decoder.inst_rd.1/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'instruction_decoder.inst_rd.1' using strategy 'smt_induction'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'instruction_decoder.inst_rd.1' using strategy 'smt_induction': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'instruction_decoder.inst_rd.1' using strategy 'smt_induction': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'instruction_decoder.inst_rd.1' using strategy 'smt_induction': timeout"
    ;;
    *)
        cat instruction_decoder.inst_rd.1/ERROR 2> /dev/null
        echo "Execution of strategy 'smt_induction' on partition 'instruction_decoder.inst_rd.1' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/instruction_decoder/strategies/instruction_decoder.inst_rd.1/smt_induction/instruction_decoder.inst_rd.1/logfile.txt'."
        exit 1
    ;;
esac
exit 0

