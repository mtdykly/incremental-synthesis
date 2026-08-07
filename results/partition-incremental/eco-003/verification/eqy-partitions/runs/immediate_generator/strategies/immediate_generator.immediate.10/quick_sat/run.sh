yosys -ql run.log run.ys
if grep "SAT temporal induction proof finished - model found for base case: FAIL!" run.log > /dev/null ; then
	echo FAIL > status
	echo "Could not prove equivalence of partition 'immediate_generator.immediate.10' using strategy 'quick_sat'"
elif grep "Reached maximum number of time steps -> proof failed." run.log > /dev/null ; then
	echo UNKNOWN > status
	echo "Could not prove equivalence of partition 'immediate_generator.immediate.10' using strategy 'quick_sat'"
elif grep "Induction step proven: SUCCESS!" run.log > /dev/null ; then
	echo PASS > status
	echo "Proved equivalence of partition 'immediate_generator.immediate.10' using strategy 'quick_sat'"
else
	echo ERROR > status
	echo "Execution of strategy 'quick_sat' on partition 'immediate_generator.immediate.10' encountered an error.
Details can be found in '/workspace/incremental-synthesis/results/partition-incremental/eco-003/verification/eqy-partitions/runs/immediate_generator/strategies/immediate_generator.immediate.10/quick_sat/run.log'."
	exit 1
fi
exit 0

