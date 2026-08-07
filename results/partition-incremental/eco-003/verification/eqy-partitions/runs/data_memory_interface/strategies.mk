.DEFAULT_GOAL := all

strategies/data_memory_interface.read_data.9/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.9'.."
	@bash -c "cd strategies/data_memory_interface.read_data.9/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.9/pdr/status: strategies/data_memory_interface.read_data.9/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.9'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.9/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.9/smt_induction/status: strategies/data_memory_interface.read_data.9/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.9'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.9/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.8/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.8'.."
	@bash -c "cd strategies/data_memory_interface.read_data.8/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.8/pdr/status: strategies/data_memory_interface.read_data.8/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.8'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.8/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.8/smt_induction/status: strategies/data_memory_interface.read_data.8/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.8'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.8/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.7/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.7'.."
	@bash -c "cd strategies/data_memory_interface.read_data.7/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.7/pdr/status: strategies/data_memory_interface.read_data.7/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.7'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.7/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.7/smt_induction/status: strategies/data_memory_interface.read_data.7/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.7'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.7/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.6/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.6'.."
	@bash -c "cd strategies/data_memory_interface.read_data.6/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.6/pdr/status: strategies/data_memory_interface.read_data.6/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.6'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.6/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.6/smt_induction/status: strategies/data_memory_interface.read_data.6/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.6'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.6/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.5/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.5'.."
	@bash -c "cd strategies/data_memory_interface.read_data.5/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.5/pdr/status: strategies/data_memory_interface.read_data.5/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.5'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.5/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.5/smt_induction/status: strategies/data_memory_interface.read_data.5/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.5'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.5/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.4/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.4'.."
	@bash -c "cd strategies/data_memory_interface.read_data.4/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.4/pdr/status: strategies/data_memory_interface.read_data.4/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.4'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.4/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.4/smt_induction/status: strategies/data_memory_interface.read_data.4/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.4'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.4/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.3'.."
	@bash -c "cd strategies/data_memory_interface.read_data.3/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.3/pdr/status: strategies/data_memory_interface.read_data.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.3'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.3/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.3/smt_induction/status: strategies/data_memory_interface.read_data.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.3'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.3/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.31/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.31'.."
	@bash -c "cd strategies/data_memory_interface.read_data.31/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.31/pdr/status: strategies/data_memory_interface.read_data.31/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.31'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.31/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.31/smt_induction/status: strategies/data_memory_interface.read_data.31/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.31'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.31/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.30/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.30'.."
	@bash -c "cd strategies/data_memory_interface.read_data.30/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.30/pdr/status: strategies/data_memory_interface.read_data.30/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.30'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.30/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.30/smt_induction/status: strategies/data_memory_interface.read_data.30/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.30'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.30/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.2'.."
	@bash -c "cd strategies/data_memory_interface.read_data.2/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.2/pdr/status: strategies/data_memory_interface.read_data.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.2'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.2/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.2/smt_induction/status: strategies/data_memory_interface.read_data.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.2'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.2/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.29/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.29'.."
	@bash -c "cd strategies/data_memory_interface.read_data.29/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.29/pdr/status: strategies/data_memory_interface.read_data.29/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.29'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.29/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.29/smt_induction/status: strategies/data_memory_interface.read_data.29/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.29'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.29/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.28/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.28'.."
	@bash -c "cd strategies/data_memory_interface.read_data.28/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.28/pdr/status: strategies/data_memory_interface.read_data.28/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.28'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.28/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.28/smt_induction/status: strategies/data_memory_interface.read_data.28/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.28'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.28/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.27/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.27'.."
	@bash -c "cd strategies/data_memory_interface.read_data.27/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.27/pdr/status: strategies/data_memory_interface.read_data.27/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.27'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.27/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.27/smt_induction/status: strategies/data_memory_interface.read_data.27/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.27'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.27/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.26/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.26'.."
	@bash -c "cd strategies/data_memory_interface.read_data.26/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.26/pdr/status: strategies/data_memory_interface.read_data.26/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.26'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.26/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.26/smt_induction/status: strategies/data_memory_interface.read_data.26/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.26'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.26/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.25/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.25'.."
	@bash -c "cd strategies/data_memory_interface.read_data.25/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.25/pdr/status: strategies/data_memory_interface.read_data.25/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.25'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.25/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.25/smt_induction/status: strategies/data_memory_interface.read_data.25/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.25'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.25/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.24/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.24'.."
	@bash -c "cd strategies/data_memory_interface.read_data.24/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.24/pdr/status: strategies/data_memory_interface.read_data.24/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.24'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.24/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.24/smt_induction/status: strategies/data_memory_interface.read_data.24/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.24'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.24/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.23/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.23'.."
	@bash -c "cd strategies/data_memory_interface.read_data.23/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.23/pdr/status: strategies/data_memory_interface.read_data.23/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.23'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.23/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.23/smt_induction/status: strategies/data_memory_interface.read_data.23/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.23'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.23/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.22/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.22'.."
	@bash -c "cd strategies/data_memory_interface.read_data.22/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.22/pdr/status: strategies/data_memory_interface.read_data.22/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.22'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.22/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.22/smt_induction/status: strategies/data_memory_interface.read_data.22/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.22'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.22/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.21/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.21'.."
	@bash -c "cd strategies/data_memory_interface.read_data.21/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.21/pdr/status: strategies/data_memory_interface.read_data.21/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.21'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.21/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.21/smt_induction/status: strategies/data_memory_interface.read_data.21/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.21'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.21/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.20/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.20'.."
	@bash -c "cd strategies/data_memory_interface.read_data.20/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.20/pdr/status: strategies/data_memory_interface.read_data.20/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.20'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.20/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.20/smt_induction/status: strategies/data_memory_interface.read_data.20/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.20'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.20/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.1'.."
	@bash -c "cd strategies/data_memory_interface.read_data.1/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.1/pdr/status: strategies/data_memory_interface.read_data.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.1'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.1/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.1/smt_induction/status: strategies/data_memory_interface.read_data.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.1'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.1/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.19/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.19'.."
	@bash -c "cd strategies/data_memory_interface.read_data.19/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.19/pdr/status: strategies/data_memory_interface.read_data.19/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.19'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.19/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.19/smt_induction/status: strategies/data_memory_interface.read_data.19/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.19'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.19/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.18/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.18'.."
	@bash -c "cd strategies/data_memory_interface.read_data.18/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.18/pdr/status: strategies/data_memory_interface.read_data.18/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.18'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.18/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.18/smt_induction/status: strategies/data_memory_interface.read_data.18/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.18'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.18/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.17/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.17'.."
	@bash -c "cd strategies/data_memory_interface.read_data.17/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.17/pdr/status: strategies/data_memory_interface.read_data.17/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.17'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.17/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.17/smt_induction/status: strategies/data_memory_interface.read_data.17/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.17'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.17/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.16/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.16'.."
	@bash -c "cd strategies/data_memory_interface.read_data.16/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.16/pdr/status: strategies/data_memory_interface.read_data.16/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.16'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.16/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.16/smt_induction/status: strategies/data_memory_interface.read_data.16/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.16'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.16/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.15/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.15'.."
	@bash -c "cd strategies/data_memory_interface.read_data.15/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.15/pdr/status: strategies/data_memory_interface.read_data.15/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.15'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.15/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.15/smt_induction/status: strategies/data_memory_interface.read_data.15/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.15'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.15/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.14/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.14'.."
	@bash -c "cd strategies/data_memory_interface.read_data.14/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.14/pdr/status: strategies/data_memory_interface.read_data.14/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.14'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.14/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.14/smt_induction/status: strategies/data_memory_interface.read_data.14/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.14'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.14/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.13/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.13'.."
	@bash -c "cd strategies/data_memory_interface.read_data.13/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.13/pdr/status: strategies/data_memory_interface.read_data.13/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.13'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.13/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.13/smt_induction/status: strategies/data_memory_interface.read_data.13/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.13'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.13/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.12/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.12'.."
	@bash -c "cd strategies/data_memory_interface.read_data.12/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.12/pdr/status: strategies/data_memory_interface.read_data.12/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.12'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.12/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.12/smt_induction/status: strategies/data_memory_interface.read_data.12/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.12'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.12/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.11/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.11'.."
	@bash -c "cd strategies/data_memory_interface.read_data.11/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.11/pdr/status: strategies/data_memory_interface.read_data.11/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.11'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.11/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.11/smt_induction/status: strategies/data_memory_interface.read_data.11/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.11'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.11/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.10/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.10'.."
	@bash -c "cd strategies/data_memory_interface.read_data.10/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.10/pdr/status: strategies/data_memory_interface.read_data.10/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.10'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.10/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.10/smt_induction/status: strategies/data_memory_interface.read_data.10/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.10'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.10/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.read_data.0'.."
	@bash -c "cd strategies/data_memory_interface.read_data.0/quick_sat; source run.sh"

strategies/data_memory_interface.read_data.0/pdr/status: strategies/data_memory_interface.read_data.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.read_data.0'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.0/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.read_data.0/smt_induction/status: strategies/data_memory_interface.read_data.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.read_data.0'.."; \
		bash -c "cd strategies/data_memory_interface.read_data.0/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_enable/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_enable'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_enable/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_enable/pdr/status: strategies/data_memory_interface.bus_write_enable/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_enable'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_enable/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_enable/smt_induction/status: strategies/data_memory_interface.bus_write_enable/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_enable'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_enable/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.9/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.9'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.9/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.9/pdr/status: strategies/data_memory_interface.bus_write_data.9/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.9'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.9/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.9/smt_induction/status: strategies/data_memory_interface.bus_write_data.9/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.9'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.9/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.8/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.8'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.8/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.8/pdr/status: strategies/data_memory_interface.bus_write_data.8/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.8'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.8/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.8/smt_induction/status: strategies/data_memory_interface.bus_write_data.8/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.8'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.8/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.7/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.7'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.7/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.7/pdr/status: strategies/data_memory_interface.bus_write_data.7/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.7'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.7/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.7/smt_induction/status: strategies/data_memory_interface.bus_write_data.7/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.7'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.7/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.6/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.6'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.6/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.6/pdr/status: strategies/data_memory_interface.bus_write_data.6/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.6'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.6/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.6/smt_induction/status: strategies/data_memory_interface.bus_write_data.6/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.6'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.6/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.5/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.5'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.5/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.5/pdr/status: strategies/data_memory_interface.bus_write_data.5/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.5'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.5/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.5/smt_induction/status: strategies/data_memory_interface.bus_write_data.5/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.5'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.5/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.4/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.4'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.4/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.4/pdr/status: strategies/data_memory_interface.bus_write_data.4/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.4'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.4/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.4/smt_induction/status: strategies/data_memory_interface.bus_write_data.4/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.4'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.4/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.3'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.3/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.3/pdr/status: strategies/data_memory_interface.bus_write_data.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.3'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.3/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.3/smt_induction/status: strategies/data_memory_interface.bus_write_data.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.3'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.3/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.31/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.31'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.31/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.31/pdr/status: strategies/data_memory_interface.bus_write_data.31/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.31'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.31/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.31/smt_induction/status: strategies/data_memory_interface.bus_write_data.31/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.31'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.31/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.30/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.30'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.30/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.30/pdr/status: strategies/data_memory_interface.bus_write_data.30/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.30'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.30/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.30/smt_induction/status: strategies/data_memory_interface.bus_write_data.30/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.30'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.30/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.2'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.2/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.2/pdr/status: strategies/data_memory_interface.bus_write_data.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.2'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.2/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.2/smt_induction/status: strategies/data_memory_interface.bus_write_data.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.2'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.2/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.29/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.29'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.29/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.29/pdr/status: strategies/data_memory_interface.bus_write_data.29/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.29'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.29/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.29/smt_induction/status: strategies/data_memory_interface.bus_write_data.29/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.29'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.29/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.28/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.28'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.28/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.28/pdr/status: strategies/data_memory_interface.bus_write_data.28/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.28'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.28/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.28/smt_induction/status: strategies/data_memory_interface.bus_write_data.28/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.28'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.28/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.27/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.27'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.27/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.27/pdr/status: strategies/data_memory_interface.bus_write_data.27/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.27'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.27/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.27/smt_induction/status: strategies/data_memory_interface.bus_write_data.27/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.27'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.27/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.26/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.26'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.26/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.26/pdr/status: strategies/data_memory_interface.bus_write_data.26/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.26'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.26/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.26/smt_induction/status: strategies/data_memory_interface.bus_write_data.26/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.26'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.26/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.25/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.25'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.25/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.25/pdr/status: strategies/data_memory_interface.bus_write_data.25/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.25'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.25/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.25/smt_induction/status: strategies/data_memory_interface.bus_write_data.25/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.25'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.25/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.24/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.24'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.24/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.24/pdr/status: strategies/data_memory_interface.bus_write_data.24/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.24'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.24/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.24/smt_induction/status: strategies/data_memory_interface.bus_write_data.24/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.24'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.24/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.23/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.23'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.23/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.23/pdr/status: strategies/data_memory_interface.bus_write_data.23/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.23'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.23/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.23/smt_induction/status: strategies/data_memory_interface.bus_write_data.23/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.23'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.23/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.22/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.22'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.22/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.22/pdr/status: strategies/data_memory_interface.bus_write_data.22/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.22'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.22/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.22/smt_induction/status: strategies/data_memory_interface.bus_write_data.22/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.22'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.22/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.21/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.21'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.21/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.21/pdr/status: strategies/data_memory_interface.bus_write_data.21/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.21'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.21/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.21/smt_induction/status: strategies/data_memory_interface.bus_write_data.21/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.21'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.21/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.20/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.20'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.20/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.20/pdr/status: strategies/data_memory_interface.bus_write_data.20/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.20'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.20/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.20/smt_induction/status: strategies/data_memory_interface.bus_write_data.20/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.20'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.20/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.1'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.1/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.1/pdr/status: strategies/data_memory_interface.bus_write_data.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.1'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.1/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.1/smt_induction/status: strategies/data_memory_interface.bus_write_data.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.1'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.1/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.19/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.19'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.19/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.19/pdr/status: strategies/data_memory_interface.bus_write_data.19/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.19'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.19/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.19/smt_induction/status: strategies/data_memory_interface.bus_write_data.19/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.19'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.19/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.18/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.18'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.18/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.18/pdr/status: strategies/data_memory_interface.bus_write_data.18/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.18'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.18/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.18/smt_induction/status: strategies/data_memory_interface.bus_write_data.18/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.18'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.18/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.17/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.17'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.17/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.17/pdr/status: strategies/data_memory_interface.bus_write_data.17/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.17'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.17/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.17/smt_induction/status: strategies/data_memory_interface.bus_write_data.17/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.17'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.17/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.16/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.16'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.16/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.16/pdr/status: strategies/data_memory_interface.bus_write_data.16/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.16'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.16/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.16/smt_induction/status: strategies/data_memory_interface.bus_write_data.16/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.16'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.16/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.15/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.15'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.15/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.15/pdr/status: strategies/data_memory_interface.bus_write_data.15/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.15'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.15/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.15/smt_induction/status: strategies/data_memory_interface.bus_write_data.15/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.15'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.15/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.14/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.14'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.14/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.14/pdr/status: strategies/data_memory_interface.bus_write_data.14/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.14'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.14/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.14/smt_induction/status: strategies/data_memory_interface.bus_write_data.14/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.14'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.14/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.13/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.13'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.13/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.13/pdr/status: strategies/data_memory_interface.bus_write_data.13/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.13'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.13/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.13/smt_induction/status: strategies/data_memory_interface.bus_write_data.13/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.13'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.13/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.12/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.12'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.12/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.12/pdr/status: strategies/data_memory_interface.bus_write_data.12/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.12'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.12/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.12/smt_induction/status: strategies/data_memory_interface.bus_write_data.12/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.12'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.12/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.11/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.11'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.11/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.11/pdr/status: strategies/data_memory_interface.bus_write_data.11/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.11'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.11/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.11/smt_induction/status: strategies/data_memory_interface.bus_write_data.11/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.11'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.11/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.10/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.10'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.10/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.10/pdr/status: strategies/data_memory_interface.bus_write_data.10/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.10'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.10/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.10/smt_induction/status: strategies/data_memory_interface.bus_write_data.10/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.10'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.10/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_write_data.0'.."
	@bash -c "cd strategies/data_memory_interface.bus_write_data.0/quick_sat; source run.sh"

strategies/data_memory_interface.bus_write_data.0/pdr/status: strategies/data_memory_interface.bus_write_data.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_write_data.0'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.0/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_write_data.0/smt_induction/status: strategies/data_memory_interface.bus_write_data.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_write_data.0'.."; \
		bash -c "cd strategies/data_memory_interface.bus_write_data.0/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_read_enable/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_read_enable'.."
	@bash -c "cd strategies/data_memory_interface.bus_read_enable/quick_sat; source run.sh"

strategies/data_memory_interface.bus_read_enable/pdr/status: strategies/data_memory_interface.bus_read_enable/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_read_enable'.."; \
		bash -c "cd strategies/data_memory_interface.bus_read_enable/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_read_enable/smt_induction/status: strategies/data_memory_interface.bus_read_enable/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_read_enable'.."; \
		bash -c "cd strategies/data_memory_interface.bus_read_enable/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_byte_enable.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_byte_enable.3'.."
	@bash -c "cd strategies/data_memory_interface.bus_byte_enable.3/quick_sat; source run.sh"

strategies/data_memory_interface.bus_byte_enable.3/pdr/status: strategies/data_memory_interface.bus_byte_enable.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_byte_enable.3'.."; \
		bash -c "cd strategies/data_memory_interface.bus_byte_enable.3/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_byte_enable.3/smt_induction/status: strategies/data_memory_interface.bus_byte_enable.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_byte_enable.3'.."; \
		bash -c "cd strategies/data_memory_interface.bus_byte_enable.3/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_byte_enable.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_byte_enable.2'.."
	@bash -c "cd strategies/data_memory_interface.bus_byte_enable.2/quick_sat; source run.sh"

strategies/data_memory_interface.bus_byte_enable.2/pdr/status: strategies/data_memory_interface.bus_byte_enable.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_byte_enable.2'.."; \
		bash -c "cd strategies/data_memory_interface.bus_byte_enable.2/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_byte_enable.2/smt_induction/status: strategies/data_memory_interface.bus_byte_enable.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_byte_enable.2'.."; \
		bash -c "cd strategies/data_memory_interface.bus_byte_enable.2/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_byte_enable.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_byte_enable.1'.."
	@bash -c "cd strategies/data_memory_interface.bus_byte_enable.1/quick_sat; source run.sh"

strategies/data_memory_interface.bus_byte_enable.1/pdr/status: strategies/data_memory_interface.bus_byte_enable.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_byte_enable.1'.."; \
		bash -c "cd strategies/data_memory_interface.bus_byte_enable.1/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_byte_enable.1/smt_induction/status: strategies/data_memory_interface.bus_byte_enable.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_byte_enable.1'.."; \
		bash -c "cd strategies/data_memory_interface.bus_byte_enable.1/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_byte_enable.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_byte_enable.0'.."
	@bash -c "cd strategies/data_memory_interface.bus_byte_enable.0/quick_sat; source run.sh"

strategies/data_memory_interface.bus_byte_enable.0/pdr/status: strategies/data_memory_interface.bus_byte_enable.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_byte_enable.0'.."; \
		bash -c "cd strategies/data_memory_interface.bus_byte_enable.0/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_byte_enable.0/smt_induction/status: strategies/data_memory_interface.bus_byte_enable.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_byte_enable.0'.."; \
		bash -c "cd strategies/data_memory_interface.bus_byte_enable.0/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.9/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.9'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.9/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.9/pdr/status: strategies/data_memory_interface.bus_address.9/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.9'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.9/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.9/smt_induction/status: strategies/data_memory_interface.bus_address.9/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.9'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.9/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.8/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.8'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.8/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.8/pdr/status: strategies/data_memory_interface.bus_address.8/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.8'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.8/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.8/smt_induction/status: strategies/data_memory_interface.bus_address.8/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.8'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.8/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.7/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.7'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.7/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.7/pdr/status: strategies/data_memory_interface.bus_address.7/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.7'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.7/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.7/smt_induction/status: strategies/data_memory_interface.bus_address.7/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.7'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.7/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.6/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.6'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.6/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.6/pdr/status: strategies/data_memory_interface.bus_address.6/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.6'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.6/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.6/smt_induction/status: strategies/data_memory_interface.bus_address.6/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.6'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.6/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.5/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.5'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.5/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.5/pdr/status: strategies/data_memory_interface.bus_address.5/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.5'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.5/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.5/smt_induction/status: strategies/data_memory_interface.bus_address.5/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.5'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.5/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.4/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.4'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.4/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.4/pdr/status: strategies/data_memory_interface.bus_address.4/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.4'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.4/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.4/smt_induction/status: strategies/data_memory_interface.bus_address.4/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.4'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.4/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.3'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.3/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.3/pdr/status: strategies/data_memory_interface.bus_address.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.3'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.3/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.3/smt_induction/status: strategies/data_memory_interface.bus_address.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.3'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.3/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.31/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.31'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.31/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.31/pdr/status: strategies/data_memory_interface.bus_address.31/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.31'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.31/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.31/smt_induction/status: strategies/data_memory_interface.bus_address.31/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.31'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.31/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.30/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.30'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.30/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.30/pdr/status: strategies/data_memory_interface.bus_address.30/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.30'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.30/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.30/smt_induction/status: strategies/data_memory_interface.bus_address.30/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.30'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.30/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.2'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.2/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.2/pdr/status: strategies/data_memory_interface.bus_address.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.2'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.2/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.2/smt_induction/status: strategies/data_memory_interface.bus_address.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.2'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.2/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.29/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.29'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.29/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.29/pdr/status: strategies/data_memory_interface.bus_address.29/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.29'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.29/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.29/smt_induction/status: strategies/data_memory_interface.bus_address.29/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.29'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.29/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.28/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.28'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.28/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.28/pdr/status: strategies/data_memory_interface.bus_address.28/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.28'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.28/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.28/smt_induction/status: strategies/data_memory_interface.bus_address.28/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.28'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.28/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.27/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.27'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.27/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.27/pdr/status: strategies/data_memory_interface.bus_address.27/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.27'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.27/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.27/smt_induction/status: strategies/data_memory_interface.bus_address.27/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.27'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.27/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.26/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.26'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.26/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.26/pdr/status: strategies/data_memory_interface.bus_address.26/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.26'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.26/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.26/smt_induction/status: strategies/data_memory_interface.bus_address.26/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.26'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.26/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.25/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.25'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.25/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.25/pdr/status: strategies/data_memory_interface.bus_address.25/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.25'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.25/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.25/smt_induction/status: strategies/data_memory_interface.bus_address.25/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.25'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.25/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.24/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.24'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.24/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.24/pdr/status: strategies/data_memory_interface.bus_address.24/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.24'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.24/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.24/smt_induction/status: strategies/data_memory_interface.bus_address.24/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.24'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.24/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.23/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.23'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.23/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.23/pdr/status: strategies/data_memory_interface.bus_address.23/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.23'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.23/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.23/smt_induction/status: strategies/data_memory_interface.bus_address.23/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.23'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.23/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.22/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.22'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.22/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.22/pdr/status: strategies/data_memory_interface.bus_address.22/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.22'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.22/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.22/smt_induction/status: strategies/data_memory_interface.bus_address.22/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.22'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.22/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.21/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.21'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.21/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.21/pdr/status: strategies/data_memory_interface.bus_address.21/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.21'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.21/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.21/smt_induction/status: strategies/data_memory_interface.bus_address.21/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.21'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.21/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.20/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.20'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.20/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.20/pdr/status: strategies/data_memory_interface.bus_address.20/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.20'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.20/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.20/smt_induction/status: strategies/data_memory_interface.bus_address.20/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.20'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.20/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.1'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.1/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.1/pdr/status: strategies/data_memory_interface.bus_address.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.1'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.1/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.1/smt_induction/status: strategies/data_memory_interface.bus_address.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.1'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.1/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.19/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.19'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.19/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.19/pdr/status: strategies/data_memory_interface.bus_address.19/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.19'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.19/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.19/smt_induction/status: strategies/data_memory_interface.bus_address.19/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.19'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.19/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.18/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.18'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.18/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.18/pdr/status: strategies/data_memory_interface.bus_address.18/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.18'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.18/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.18/smt_induction/status: strategies/data_memory_interface.bus_address.18/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.18'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.18/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.17/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.17'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.17/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.17/pdr/status: strategies/data_memory_interface.bus_address.17/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.17'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.17/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.17/smt_induction/status: strategies/data_memory_interface.bus_address.17/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.17'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.17/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.16/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.16'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.16/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.16/pdr/status: strategies/data_memory_interface.bus_address.16/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.16'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.16/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.16/smt_induction/status: strategies/data_memory_interface.bus_address.16/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.16'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.16/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.15/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.15'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.15/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.15/pdr/status: strategies/data_memory_interface.bus_address.15/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.15'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.15/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.15/smt_induction/status: strategies/data_memory_interface.bus_address.15/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.15'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.15/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.14/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.14'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.14/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.14/pdr/status: strategies/data_memory_interface.bus_address.14/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.14'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.14/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.14/smt_induction/status: strategies/data_memory_interface.bus_address.14/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.14'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.14/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.13/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.13'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.13/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.13/pdr/status: strategies/data_memory_interface.bus_address.13/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.13'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.13/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.13/smt_induction/status: strategies/data_memory_interface.bus_address.13/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.13'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.13/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.12/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.12'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.12/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.12/pdr/status: strategies/data_memory_interface.bus_address.12/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.12'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.12/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.12/smt_induction/status: strategies/data_memory_interface.bus_address.12/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.12'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.12/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.11/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.11'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.11/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.11/pdr/status: strategies/data_memory_interface.bus_address.11/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.11'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.11/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.11/smt_induction/status: strategies/data_memory_interface.bus_address.11/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.11'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.11/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.10/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.10'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.10/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.10/pdr/status: strategies/data_memory_interface.bus_address.10/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.10'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.10/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.10/smt_induction/status: strategies/data_memory_interface.bus_address.10/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.10'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.10/smt_induction; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'data_memory_interface.bus_address.0'.."
	@bash -c "cd strategies/data_memory_interface.bus_address.0/quick_sat; source run.sh"

strategies/data_memory_interface.bus_address.0/pdr/status: strategies/data_memory_interface.bus_address.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'data_memory_interface.bus_address.0'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.0/pdr; source run.sh"; \
	fi

strategies/data_memory_interface.bus_address.0/smt_induction/status: strategies/data_memory_interface.bus_address.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'data_memory_interface.bus_address.0'.."; \
		bash -c "cd strategies/data_memory_interface.bus_address.0/smt_induction; source run.sh"; \
	fi

.PHONY: all summary
all: strategies/data_memory_interface.bus_address.0/smt_induction/status strategies/data_memory_interface.bus_address.1/smt_induction/status strategies/data_memory_interface.bus_address.10/smt_induction/status strategies/data_memory_interface.bus_address.11/smt_induction/status strategies/data_memory_interface.bus_address.12/smt_induction/status strategies/data_memory_interface.bus_address.13/smt_induction/status strategies/data_memory_interface.bus_address.14/smt_induction/status strategies/data_memory_interface.bus_address.15/smt_induction/status strategies/data_memory_interface.bus_address.16/smt_induction/status strategies/data_memory_interface.bus_address.17/smt_induction/status strategies/data_memory_interface.bus_address.18/smt_induction/status strategies/data_memory_interface.bus_address.19/smt_induction/status strategies/data_memory_interface.bus_address.2/smt_induction/status strategies/data_memory_interface.bus_address.20/smt_induction/status strategies/data_memory_interface.bus_address.21/smt_induction/status strategies/data_memory_interface.bus_address.22/smt_induction/status strategies/data_memory_interface.bus_address.23/smt_induction/status strategies/data_memory_interface.bus_address.24/smt_induction/status strategies/data_memory_interface.bus_address.25/smt_induction/status strategies/data_memory_interface.bus_address.26/smt_induction/status strategies/data_memory_interface.bus_address.27/smt_induction/status strategies/data_memory_interface.bus_address.28/smt_induction/status strategies/data_memory_interface.bus_address.29/smt_induction/status strategies/data_memory_interface.bus_address.3/smt_induction/status strategies/data_memory_interface.bus_address.30/smt_induction/status strategies/data_memory_interface.bus_address.31/smt_induction/status strategies/data_memory_interface.bus_address.4/smt_induction/status strategies/data_memory_interface.bus_address.5/smt_induction/status strategies/data_memory_interface.bus_address.6/smt_induction/status strategies/data_memory_interface.bus_address.7/smt_induction/status strategies/data_memory_interface.bus_address.8/smt_induction/status strategies/data_memory_interface.bus_address.9/smt_induction/status strategies/data_memory_interface.bus_byte_enable.0/smt_induction/status strategies/data_memory_interface.bus_byte_enable.1/smt_induction/status strategies/data_memory_interface.bus_byte_enable.2/smt_induction/status strategies/data_memory_interface.bus_byte_enable.3/smt_induction/status strategies/data_memory_interface.bus_read_enable/smt_induction/status strategies/data_memory_interface.bus_write_data.0/smt_induction/status strategies/data_memory_interface.bus_write_data.1/smt_induction/status strategies/data_memory_interface.bus_write_data.10/smt_induction/status strategies/data_memory_interface.bus_write_data.11/smt_induction/status strategies/data_memory_interface.bus_write_data.12/smt_induction/status strategies/data_memory_interface.bus_write_data.13/smt_induction/status strategies/data_memory_interface.bus_write_data.14/smt_induction/status strategies/data_memory_interface.bus_write_data.15/smt_induction/status strategies/data_memory_interface.bus_write_data.16/smt_induction/status strategies/data_memory_interface.bus_write_data.17/smt_induction/status strategies/data_memory_interface.bus_write_data.18/smt_induction/status strategies/data_memory_interface.bus_write_data.19/smt_induction/status strategies/data_memory_interface.bus_write_data.2/smt_induction/status strategies/data_memory_interface.bus_write_data.20/smt_induction/status strategies/data_memory_interface.bus_write_data.21/smt_induction/status strategies/data_memory_interface.bus_write_data.22/smt_induction/status strategies/data_memory_interface.bus_write_data.23/smt_induction/status strategies/data_memory_interface.bus_write_data.24/smt_induction/status strategies/data_memory_interface.bus_write_data.25/smt_induction/status strategies/data_memory_interface.bus_write_data.26/smt_induction/status strategies/data_memory_interface.bus_write_data.27/smt_induction/status strategies/data_memory_interface.bus_write_data.28/smt_induction/status strategies/data_memory_interface.bus_write_data.29/smt_induction/status strategies/data_memory_interface.bus_write_data.3/smt_induction/status strategies/data_memory_interface.bus_write_data.30/smt_induction/status strategies/data_memory_interface.bus_write_data.31/smt_induction/status strategies/data_memory_interface.bus_write_data.4/smt_induction/status strategies/data_memory_interface.bus_write_data.5/smt_induction/status strategies/data_memory_interface.bus_write_data.6/smt_induction/status strategies/data_memory_interface.bus_write_data.7/smt_induction/status strategies/data_memory_interface.bus_write_data.8/smt_induction/status strategies/data_memory_interface.bus_write_data.9/smt_induction/status strategies/data_memory_interface.bus_write_enable/smt_induction/status strategies/data_memory_interface.read_data.0/smt_induction/status strategies/data_memory_interface.read_data.1/smt_induction/status strategies/data_memory_interface.read_data.10/smt_induction/status strategies/data_memory_interface.read_data.11/smt_induction/status strategies/data_memory_interface.read_data.12/smt_induction/status strategies/data_memory_interface.read_data.13/smt_induction/status strategies/data_memory_interface.read_data.14/smt_induction/status strategies/data_memory_interface.read_data.15/smt_induction/status strategies/data_memory_interface.read_data.16/smt_induction/status strategies/data_memory_interface.read_data.17/smt_induction/status strategies/data_memory_interface.read_data.18/smt_induction/status strategies/data_memory_interface.read_data.19/smt_induction/status strategies/data_memory_interface.read_data.2/smt_induction/status strategies/data_memory_interface.read_data.20/smt_induction/status strategies/data_memory_interface.read_data.21/smt_induction/status strategies/data_memory_interface.read_data.22/smt_induction/status strategies/data_memory_interface.read_data.23/smt_induction/status strategies/data_memory_interface.read_data.24/smt_induction/status strategies/data_memory_interface.read_data.25/smt_induction/status strategies/data_memory_interface.read_data.26/smt_induction/status strategies/data_memory_interface.read_data.27/smt_induction/status strategies/data_memory_interface.read_data.28/smt_induction/status strategies/data_memory_interface.read_data.29/smt_induction/status strategies/data_memory_interface.read_data.3/smt_induction/status strategies/data_memory_interface.read_data.30/smt_induction/status strategies/data_memory_interface.read_data.31/smt_induction/status strategies/data_memory_interface.read_data.4/smt_induction/status strategies/data_memory_interface.read_data.5/smt_induction/status strategies/data_memory_interface.read_data.6/smt_induction/status strategies/data_memory_interface.read_data.7/smt_induction/status strategies/data_memory_interface.read_data.8/smt_induction/status strategies/data_memory_interface.read_data.9/smt_induction/status
	$(MAKE) -f strategies.mk summary
summary:
	@rc=0 ; \
	while read f; do \
		p=$${f#strategies/} ; p=$${p%/*/status} ; \
		if grep -q "PASS" $$f ; then \
			echo "* Successfully proved equivalence of partition $$p" ; \
		else \
			echo "* Failed to prove equivalence of partition $$p" ; rc=1 ; \
		fi ; \
	done < summary_targets.list ; \
	if [ "$$rc" -eq 0 ] ; then \
		echo "* Successfully proved designs equivalent" ; \
	fi
