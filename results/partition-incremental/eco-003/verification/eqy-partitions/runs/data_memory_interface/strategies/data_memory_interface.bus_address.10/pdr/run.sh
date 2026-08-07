STATUS=ERROR
sby -f data_memory_interface.bus_address.10.sby > /dev/null && STATUS=$(awk '{print $1}' data_memory_interface.bus_address.10/status)
echo $STATUS > status
case $STATUS in
    PASS)
        echo "Proved equivalence of partition 'data_memory_interface.bus_address.10' using strategy 'pdr'"
    ;;
    FAIL)
        echo "Could not prove equivalence of partition 'data_memory_interface.bus_address.10' using strategy 'pdr': partitions not equivalent"
    ;;
    UNKNOWN)
        echo "Could not prove equivalence of partition 'data_memory_interface.bus_address.10' using strategy 'pdr': equivalence unknown"
    ;;
    TIMEOUT)
        echo "Could not prove equivalence of partition 'data_memory_interface.bus_address.10' using strategy 'pdr': timeout"
    ;;
    *)
        cat data_memory_interface.bus_address.10/ERROR 2> /dev/null
        echo "Execution of strategy 'pdr' on partition 'data_memory_interface.bus_address.10' encountered an error."
        echo "More details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/data_memory_interface/strategies/data_memory_interface.bus_address.10/pdr/data_memory_interface.bus_address.10/logfile.txt'."
        exit 1
    ;;
esac
exit 0

