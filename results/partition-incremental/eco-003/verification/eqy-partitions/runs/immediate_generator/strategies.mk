.DEFAULT_GOAL := all

strategies/immediate_generator.immediate.9/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.9'.."
	@bash -c "cd strategies/immediate_generator.immediate.9/quick_sat; source run.sh"

strategies/immediate_generator.immediate.9/pdr/status: strategies/immediate_generator.immediate.9/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.9'.."; \
		bash -c "cd strategies/immediate_generator.immediate.9/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.9/smt_induction/status: strategies/immediate_generator.immediate.9/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.9'.."; \
		bash -c "cd strategies/immediate_generator.immediate.9/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.8/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.8'.."
	@bash -c "cd strategies/immediate_generator.immediate.8/quick_sat; source run.sh"

strategies/immediate_generator.immediate.8/pdr/status: strategies/immediate_generator.immediate.8/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.8'.."; \
		bash -c "cd strategies/immediate_generator.immediate.8/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.8/smt_induction/status: strategies/immediate_generator.immediate.8/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.8'.."; \
		bash -c "cd strategies/immediate_generator.immediate.8/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.7/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.7'.."
	@bash -c "cd strategies/immediate_generator.immediate.7/quick_sat; source run.sh"

strategies/immediate_generator.immediate.7/pdr/status: strategies/immediate_generator.immediate.7/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.7'.."; \
		bash -c "cd strategies/immediate_generator.immediate.7/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.7/smt_induction/status: strategies/immediate_generator.immediate.7/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.7'.."; \
		bash -c "cd strategies/immediate_generator.immediate.7/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.6/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.6'.."
	@bash -c "cd strategies/immediate_generator.immediate.6/quick_sat; source run.sh"

strategies/immediate_generator.immediate.6/pdr/status: strategies/immediate_generator.immediate.6/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.6'.."; \
		bash -c "cd strategies/immediate_generator.immediate.6/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.6/smt_induction/status: strategies/immediate_generator.immediate.6/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.6'.."; \
		bash -c "cd strategies/immediate_generator.immediate.6/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.5/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.5'.."
	@bash -c "cd strategies/immediate_generator.immediate.5/quick_sat; source run.sh"

strategies/immediate_generator.immediate.5/pdr/status: strategies/immediate_generator.immediate.5/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.5'.."; \
		bash -c "cd strategies/immediate_generator.immediate.5/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.5/smt_induction/status: strategies/immediate_generator.immediate.5/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.5'.."; \
		bash -c "cd strategies/immediate_generator.immediate.5/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.4/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.4'.."
	@bash -c "cd strategies/immediate_generator.immediate.4/quick_sat; source run.sh"

strategies/immediate_generator.immediate.4/pdr/status: strategies/immediate_generator.immediate.4/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.4'.."; \
		bash -c "cd strategies/immediate_generator.immediate.4/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.4/smt_induction/status: strategies/immediate_generator.immediate.4/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.4'.."; \
		bash -c "cd strategies/immediate_generator.immediate.4/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.3'.."
	@bash -c "cd strategies/immediate_generator.immediate.3/quick_sat; source run.sh"

strategies/immediate_generator.immediate.3/pdr/status: strategies/immediate_generator.immediate.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.3'.."; \
		bash -c "cd strategies/immediate_generator.immediate.3/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.3/smt_induction/status: strategies/immediate_generator.immediate.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.3'.."; \
		bash -c "cd strategies/immediate_generator.immediate.3/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.31/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.31'.."
	@bash -c "cd strategies/immediate_generator.immediate.31/quick_sat; source run.sh"

strategies/immediate_generator.immediate.31/pdr/status: strategies/immediate_generator.immediate.31/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.31'.."; \
		bash -c "cd strategies/immediate_generator.immediate.31/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.31/smt_induction/status: strategies/immediate_generator.immediate.31/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.31'.."; \
		bash -c "cd strategies/immediate_generator.immediate.31/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.30/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.30'.."
	@bash -c "cd strategies/immediate_generator.immediate.30/quick_sat; source run.sh"

strategies/immediate_generator.immediate.30/pdr/status: strategies/immediate_generator.immediate.30/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.30'.."; \
		bash -c "cd strategies/immediate_generator.immediate.30/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.30/smt_induction/status: strategies/immediate_generator.immediate.30/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.30'.."; \
		bash -c "cd strategies/immediate_generator.immediate.30/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.2'.."
	@bash -c "cd strategies/immediate_generator.immediate.2/quick_sat; source run.sh"

strategies/immediate_generator.immediate.2/pdr/status: strategies/immediate_generator.immediate.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.2'.."; \
		bash -c "cd strategies/immediate_generator.immediate.2/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.2/smt_induction/status: strategies/immediate_generator.immediate.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.2'.."; \
		bash -c "cd strategies/immediate_generator.immediate.2/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.29/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.29'.."
	@bash -c "cd strategies/immediate_generator.immediate.29/quick_sat; source run.sh"

strategies/immediate_generator.immediate.29/pdr/status: strategies/immediate_generator.immediate.29/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.29'.."; \
		bash -c "cd strategies/immediate_generator.immediate.29/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.29/smt_induction/status: strategies/immediate_generator.immediate.29/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.29'.."; \
		bash -c "cd strategies/immediate_generator.immediate.29/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.28/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.28'.."
	@bash -c "cd strategies/immediate_generator.immediate.28/quick_sat; source run.sh"

strategies/immediate_generator.immediate.28/pdr/status: strategies/immediate_generator.immediate.28/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.28'.."; \
		bash -c "cd strategies/immediate_generator.immediate.28/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.28/smt_induction/status: strategies/immediate_generator.immediate.28/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.28'.."; \
		bash -c "cd strategies/immediate_generator.immediate.28/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.27/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.27'.."
	@bash -c "cd strategies/immediate_generator.immediate.27/quick_sat; source run.sh"

strategies/immediate_generator.immediate.27/pdr/status: strategies/immediate_generator.immediate.27/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.27'.."; \
		bash -c "cd strategies/immediate_generator.immediate.27/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.27/smt_induction/status: strategies/immediate_generator.immediate.27/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.27'.."; \
		bash -c "cd strategies/immediate_generator.immediate.27/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.26/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.26'.."
	@bash -c "cd strategies/immediate_generator.immediate.26/quick_sat; source run.sh"

strategies/immediate_generator.immediate.26/pdr/status: strategies/immediate_generator.immediate.26/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.26'.."; \
		bash -c "cd strategies/immediate_generator.immediate.26/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.26/smt_induction/status: strategies/immediate_generator.immediate.26/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.26'.."; \
		bash -c "cd strategies/immediate_generator.immediate.26/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.25/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.25'.."
	@bash -c "cd strategies/immediate_generator.immediate.25/quick_sat; source run.sh"

strategies/immediate_generator.immediate.25/pdr/status: strategies/immediate_generator.immediate.25/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.25'.."; \
		bash -c "cd strategies/immediate_generator.immediate.25/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.25/smt_induction/status: strategies/immediate_generator.immediate.25/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.25'.."; \
		bash -c "cd strategies/immediate_generator.immediate.25/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.24/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.24'.."
	@bash -c "cd strategies/immediate_generator.immediate.24/quick_sat; source run.sh"

strategies/immediate_generator.immediate.24/pdr/status: strategies/immediate_generator.immediate.24/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.24'.."; \
		bash -c "cd strategies/immediate_generator.immediate.24/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.24/smt_induction/status: strategies/immediate_generator.immediate.24/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.24'.."; \
		bash -c "cd strategies/immediate_generator.immediate.24/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.23/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.23'.."
	@bash -c "cd strategies/immediate_generator.immediate.23/quick_sat; source run.sh"

strategies/immediate_generator.immediate.23/pdr/status: strategies/immediate_generator.immediate.23/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.23'.."; \
		bash -c "cd strategies/immediate_generator.immediate.23/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.23/smt_induction/status: strategies/immediate_generator.immediate.23/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.23'.."; \
		bash -c "cd strategies/immediate_generator.immediate.23/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.22/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.22'.."
	@bash -c "cd strategies/immediate_generator.immediate.22/quick_sat; source run.sh"

strategies/immediate_generator.immediate.22/pdr/status: strategies/immediate_generator.immediate.22/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.22'.."; \
		bash -c "cd strategies/immediate_generator.immediate.22/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.22/smt_induction/status: strategies/immediate_generator.immediate.22/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.22'.."; \
		bash -c "cd strategies/immediate_generator.immediate.22/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.21/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.21'.."
	@bash -c "cd strategies/immediate_generator.immediate.21/quick_sat; source run.sh"

strategies/immediate_generator.immediate.21/pdr/status: strategies/immediate_generator.immediate.21/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.21'.."; \
		bash -c "cd strategies/immediate_generator.immediate.21/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.21/smt_induction/status: strategies/immediate_generator.immediate.21/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.21'.."; \
		bash -c "cd strategies/immediate_generator.immediate.21/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.20/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.20'.."
	@bash -c "cd strategies/immediate_generator.immediate.20/quick_sat; source run.sh"

strategies/immediate_generator.immediate.20/pdr/status: strategies/immediate_generator.immediate.20/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.20'.."; \
		bash -c "cd strategies/immediate_generator.immediate.20/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.20/smt_induction/status: strategies/immediate_generator.immediate.20/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.20'.."; \
		bash -c "cd strategies/immediate_generator.immediate.20/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.1'.."
	@bash -c "cd strategies/immediate_generator.immediate.1/quick_sat; source run.sh"

strategies/immediate_generator.immediate.1/pdr/status: strategies/immediate_generator.immediate.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.1'.."; \
		bash -c "cd strategies/immediate_generator.immediate.1/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.1/smt_induction/status: strategies/immediate_generator.immediate.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.1'.."; \
		bash -c "cd strategies/immediate_generator.immediate.1/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.19/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.19'.."
	@bash -c "cd strategies/immediate_generator.immediate.19/quick_sat; source run.sh"

strategies/immediate_generator.immediate.19/pdr/status: strategies/immediate_generator.immediate.19/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.19'.."; \
		bash -c "cd strategies/immediate_generator.immediate.19/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.19/smt_induction/status: strategies/immediate_generator.immediate.19/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.19'.."; \
		bash -c "cd strategies/immediate_generator.immediate.19/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.18/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.18'.."
	@bash -c "cd strategies/immediate_generator.immediate.18/quick_sat; source run.sh"

strategies/immediate_generator.immediate.18/pdr/status: strategies/immediate_generator.immediate.18/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.18'.."; \
		bash -c "cd strategies/immediate_generator.immediate.18/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.18/smt_induction/status: strategies/immediate_generator.immediate.18/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.18'.."; \
		bash -c "cd strategies/immediate_generator.immediate.18/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.17/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.17'.."
	@bash -c "cd strategies/immediate_generator.immediate.17/quick_sat; source run.sh"

strategies/immediate_generator.immediate.17/pdr/status: strategies/immediate_generator.immediate.17/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.17'.."; \
		bash -c "cd strategies/immediate_generator.immediate.17/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.17/smt_induction/status: strategies/immediate_generator.immediate.17/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.17'.."; \
		bash -c "cd strategies/immediate_generator.immediate.17/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.16/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.16'.."
	@bash -c "cd strategies/immediate_generator.immediate.16/quick_sat; source run.sh"

strategies/immediate_generator.immediate.16/pdr/status: strategies/immediate_generator.immediate.16/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.16'.."; \
		bash -c "cd strategies/immediate_generator.immediate.16/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.16/smt_induction/status: strategies/immediate_generator.immediate.16/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.16'.."; \
		bash -c "cd strategies/immediate_generator.immediate.16/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.15/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.15'.."
	@bash -c "cd strategies/immediate_generator.immediate.15/quick_sat; source run.sh"

strategies/immediate_generator.immediate.15/pdr/status: strategies/immediate_generator.immediate.15/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.15'.."; \
		bash -c "cd strategies/immediate_generator.immediate.15/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.15/smt_induction/status: strategies/immediate_generator.immediate.15/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.15'.."; \
		bash -c "cd strategies/immediate_generator.immediate.15/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.14/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.14'.."
	@bash -c "cd strategies/immediate_generator.immediate.14/quick_sat; source run.sh"

strategies/immediate_generator.immediate.14/pdr/status: strategies/immediate_generator.immediate.14/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.14'.."; \
		bash -c "cd strategies/immediate_generator.immediate.14/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.14/smt_induction/status: strategies/immediate_generator.immediate.14/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.14'.."; \
		bash -c "cd strategies/immediate_generator.immediate.14/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.13/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.13'.."
	@bash -c "cd strategies/immediate_generator.immediate.13/quick_sat; source run.sh"

strategies/immediate_generator.immediate.13/pdr/status: strategies/immediate_generator.immediate.13/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.13'.."; \
		bash -c "cd strategies/immediate_generator.immediate.13/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.13/smt_induction/status: strategies/immediate_generator.immediate.13/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.13'.."; \
		bash -c "cd strategies/immediate_generator.immediate.13/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.12/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.12'.."
	@bash -c "cd strategies/immediate_generator.immediate.12/quick_sat; source run.sh"

strategies/immediate_generator.immediate.12/pdr/status: strategies/immediate_generator.immediate.12/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.12'.."; \
		bash -c "cd strategies/immediate_generator.immediate.12/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.12/smt_induction/status: strategies/immediate_generator.immediate.12/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.12'.."; \
		bash -c "cd strategies/immediate_generator.immediate.12/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.11/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.11'.."
	@bash -c "cd strategies/immediate_generator.immediate.11/quick_sat; source run.sh"

strategies/immediate_generator.immediate.11/pdr/status: strategies/immediate_generator.immediate.11/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.11'.."; \
		bash -c "cd strategies/immediate_generator.immediate.11/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.11/smt_induction/status: strategies/immediate_generator.immediate.11/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.11'.."; \
		bash -c "cd strategies/immediate_generator.immediate.11/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.10/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.10'.."
	@bash -c "cd strategies/immediate_generator.immediate.10/quick_sat; source run.sh"

strategies/immediate_generator.immediate.10/pdr/status: strategies/immediate_generator.immediate.10/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.10'.."; \
		bash -c "cd strategies/immediate_generator.immediate.10/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.10/smt_induction/status: strategies/immediate_generator.immediate.10/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.10'.."; \
		bash -c "cd strategies/immediate_generator.immediate.10/smt_induction; source run.sh"; \
	fi

strategies/immediate_generator.immediate.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'immediate_generator.immediate.0'.."
	@bash -c "cd strategies/immediate_generator.immediate.0/quick_sat; source run.sh"

strategies/immediate_generator.immediate.0/pdr/status: strategies/immediate_generator.immediate.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'immediate_generator.immediate.0'.."; \
		bash -c "cd strategies/immediate_generator.immediate.0/pdr; source run.sh"; \
	fi

strategies/immediate_generator.immediate.0/smt_induction/status: strategies/immediate_generator.immediate.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'immediate_generator.immediate.0'.."; \
		bash -c "cd strategies/immediate_generator.immediate.0/smt_induction; source run.sh"; \
	fi

.PHONY: all summary
all: strategies/immediate_generator.immediate.0/smt_induction/status strategies/immediate_generator.immediate.1/smt_induction/status strategies/immediate_generator.immediate.10/smt_induction/status strategies/immediate_generator.immediate.11/smt_induction/status strategies/immediate_generator.immediate.12/smt_induction/status strategies/immediate_generator.immediate.13/smt_induction/status strategies/immediate_generator.immediate.14/smt_induction/status strategies/immediate_generator.immediate.15/smt_induction/status strategies/immediate_generator.immediate.16/smt_induction/status strategies/immediate_generator.immediate.17/smt_induction/status strategies/immediate_generator.immediate.18/smt_induction/status strategies/immediate_generator.immediate.19/smt_induction/status strategies/immediate_generator.immediate.2/smt_induction/status strategies/immediate_generator.immediate.20/smt_induction/status strategies/immediate_generator.immediate.21/smt_induction/status strategies/immediate_generator.immediate.22/smt_induction/status strategies/immediate_generator.immediate.23/smt_induction/status strategies/immediate_generator.immediate.24/smt_induction/status strategies/immediate_generator.immediate.25/smt_induction/status strategies/immediate_generator.immediate.26/smt_induction/status strategies/immediate_generator.immediate.27/smt_induction/status strategies/immediate_generator.immediate.28/smt_induction/status strategies/immediate_generator.immediate.29/smt_induction/status strategies/immediate_generator.immediate.3/smt_induction/status strategies/immediate_generator.immediate.30/smt_induction/status strategies/immediate_generator.immediate.31/smt_induction/status strategies/immediate_generator.immediate.4/smt_induction/status strategies/immediate_generator.immediate.5/smt_induction/status strategies/immediate_generator.immediate.6/smt_induction/status strategies/immediate_generator.immediate.7/smt_induction/status strategies/immediate_generator.immediate.8/smt_induction/status strategies/immediate_generator.immediate.9/smt_induction/status
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
