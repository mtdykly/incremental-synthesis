STATUS=ERROR
sby -f instruction_decoder.inst_opcode.5.sby > /dev/null && STATUS=$(awk '{print $1}' instruction_decoder.inst_opcode.5/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'instruction_decoder.inst_opcode.5' using strategy 'pdr'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'instruction_decoder.inst_opcode.5' using strategy 'pdr': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'instruction_decoder.inst_opcode.5' using strategy 'pdr': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'instruction_decoder.inst_opcode.5' using strategy 'pdr': timeout"
    ;;
    *)
        cat instruction_decoder.inst_opcode.5/ERROR 2> /dev/null
        echo "Execution of strategy 'pdr' on partition 'instruction_decoder.inst_opcode.5' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/instruction_decoder/strategies/instruction_decoder.inst_opcode.5/pdr/instruction_decoder.inst_opcode.5/logfile.txt'."
        exit 1
    ;;
esac
exit 0

