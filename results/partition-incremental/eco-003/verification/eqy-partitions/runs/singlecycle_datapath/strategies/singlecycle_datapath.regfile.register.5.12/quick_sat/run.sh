yosys -ql run.log run.ys
if grep "SAT temporal induction proof finished - model found for base case: FAIL!" run.log > /dev/null ; then
	echo FAIL > status
	echo "Could not prove equivalence of partition 'singlecycle_datapath.regfile.register.5.12' using strategy 'quick_sat'"
elif grep "Reached maximum number of time steps -> proof failed." run.log > /dev/null ; then
	echo UNKNOWN > status
	echo "Could not prove equivalence of partition 'singlecycle_datapath.regfile.register.5.12' using strategy 'quick_sat'"
elif grep "Induction step proven: SUCCESS!" run.log > /dev/null ; then
	echo PASS > status
	echo "Proved equivalence of partition 'singlecycle_datapath.regfile.register.5.12' using strategy 'quick_sat'"
else
	echo ERROR > status
	echo "Execution of strategy 'quick_sat' on partition 'singlecycle_datapath.regfile.register.5.12' encountered an error.
Details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/singlecycle_datapath/strategies/singlecycle_datapath.regfile.register.5.12/quick_sat/run.log'."
	exit 1
fi
exit 0

