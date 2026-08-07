.DEFAULT_GOAL := all

strategies/instruction_decoder.inst_rs2.4/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs2.4'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs2.4/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs2.4/pdr/status: strategies/instruction_decoder.inst_rs2.4/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs2.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.4/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs2.4/smt_induction/status: strategies/instruction_decoder.inst_rs2.4/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs2.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.4/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs2.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs2.3'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs2.3/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs2.3/pdr/status: strategies/instruction_decoder.inst_rs2.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs2.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.3/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs2.3/smt_induction/status: strategies/instruction_decoder.inst_rs2.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs2.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.3/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs2.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs2.2'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs2.2/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs2.2/pdr/status: strategies/instruction_decoder.inst_rs2.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs2.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.2/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs2.2/smt_induction/status: strategies/instruction_decoder.inst_rs2.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs2.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.2/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs2.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs2.1'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs2.1/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs2.1/pdr/status: strategies/instruction_decoder.inst_rs2.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs2.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.1/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs2.1/smt_induction/status: strategies/instruction_decoder.inst_rs2.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs2.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.1/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs2.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs2.0'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs2.0/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs2.0/pdr/status: strategies/instruction_decoder.inst_rs2.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs2.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.0/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs2.0/smt_induction/status: strategies/instruction_decoder.inst_rs2.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs2.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs2.0/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.4/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs1.4'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs1.4/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs1.4/pdr/status: strategies/instruction_decoder.inst_rs1.4/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs1.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.4/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.4/smt_induction/status: strategies/instruction_decoder.inst_rs1.4/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs1.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.4/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs1.3'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs1.3/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs1.3/pdr/status: strategies/instruction_decoder.inst_rs1.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs1.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.3/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.3/smt_induction/status: strategies/instruction_decoder.inst_rs1.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs1.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.3/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs1.2'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs1.2/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs1.2/pdr/status: strategies/instruction_decoder.inst_rs1.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs1.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.2/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.2/smt_induction/status: strategies/instruction_decoder.inst_rs1.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs1.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.2/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs1.1'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs1.1/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs1.1/pdr/status: strategies/instruction_decoder.inst_rs1.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs1.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.1/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.1/smt_induction/status: strategies/instruction_decoder.inst_rs1.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs1.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.1/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rs1.0'.."
	@bash -c "cd strategies/instruction_decoder.inst_rs1.0/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rs1.0/pdr/status: strategies/instruction_decoder.inst_rs1.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rs1.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.0/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rs1.0/smt_induction/status: strategies/instruction_decoder.inst_rs1.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rs1.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rs1.0/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.4/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rd.4'.."
	@bash -c "cd strategies/instruction_decoder.inst_rd.4/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rd.4/pdr/status: strategies/instruction_decoder.inst_rd.4/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rd.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.4/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.4/smt_induction/status: strategies/instruction_decoder.inst_rd.4/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rd.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.4/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rd.3'.."
	@bash -c "cd strategies/instruction_decoder.inst_rd.3/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rd.3/pdr/status: strategies/instruction_decoder.inst_rd.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rd.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.3/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.3/smt_induction/status: strategies/instruction_decoder.inst_rd.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rd.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.3/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rd.2'.."
	@bash -c "cd strategies/instruction_decoder.inst_rd.2/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rd.2/pdr/status: strategies/instruction_decoder.inst_rd.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rd.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.2/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.2/smt_induction/status: strategies/instruction_decoder.inst_rd.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rd.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.2/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rd.1'.."
	@bash -c "cd strategies/instruction_decoder.inst_rd.1/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rd.1/pdr/status: strategies/instruction_decoder.inst_rd.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rd.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.1/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.1/smt_induction/status: strategies/instruction_decoder.inst_rd.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rd.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.1/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_rd.0'.."
	@bash -c "cd strategies/instruction_decoder.inst_rd.0/quick_sat; source run.sh"

strategies/instruction_decoder.inst_rd.0/pdr/status: strategies/instruction_decoder.inst_rd.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_rd.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.0/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_rd.0/smt_induction/status: strategies/instruction_decoder.inst_rd.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_rd.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_rd.0/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.6/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_opcode.6'.."
	@bash -c "cd strategies/instruction_decoder.inst_opcode.6/quick_sat; source run.sh"

strategies/instruction_decoder.inst_opcode.6/pdr/status: strategies/instruction_decoder.inst_opcode.6/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_opcode.6'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.6/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.6/smt_induction/status: strategies/instruction_decoder.inst_opcode.6/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_opcode.6'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.6/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.5/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_opcode.5'.."
	@bash -c "cd strategies/instruction_decoder.inst_opcode.5/quick_sat; source run.sh"

strategies/instruction_decoder.inst_opcode.5/pdr/status: strategies/instruction_decoder.inst_opcode.5/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_opcode.5'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.5/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.5/smt_induction/status: strategies/instruction_decoder.inst_opcode.5/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_opcode.5'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.5/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.4/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_opcode.4'.."
	@bash -c "cd strategies/instruction_decoder.inst_opcode.4/quick_sat; source run.sh"

strategies/instruction_decoder.inst_opcode.4/pdr/status: strategies/instruction_decoder.inst_opcode.4/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_opcode.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.4/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.4/smt_induction/status: strategies/instruction_decoder.inst_opcode.4/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_opcode.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.4/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_opcode.3'.."
	@bash -c "cd strategies/instruction_decoder.inst_opcode.3/quick_sat; source run.sh"

strategies/instruction_decoder.inst_opcode.3/pdr/status: strategies/instruction_decoder.inst_opcode.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_opcode.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.3/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.3/smt_induction/status: strategies/instruction_decoder.inst_opcode.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_opcode.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.3/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_opcode.2'.."
	@bash -c "cd strategies/instruction_decoder.inst_opcode.2/quick_sat; source run.sh"

strategies/instruction_decoder.inst_opcode.2/pdr/status: strategies/instruction_decoder.inst_opcode.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_opcode.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.2/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.2/smt_induction/status: strategies/instruction_decoder.inst_opcode.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_opcode.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.2/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_opcode.1'.."
	@bash -c "cd strategies/instruction_decoder.inst_opcode.1/quick_sat; source run.sh"

strategies/instruction_decoder.inst_opcode.1/pdr/status: strategies/instruction_decoder.inst_opcode.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_opcode.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.1/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.1/smt_induction/status: strategies/instruction_decoder.inst_opcode.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_opcode.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.1/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_opcode.0'.."
	@bash -c "cd strategies/instruction_decoder.inst_opcode.0/quick_sat; source run.sh"

strategies/instruction_decoder.inst_opcode.0/pdr/status: strategies/instruction_decoder.inst_opcode.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_opcode.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.0/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_opcode.0/smt_induction/status: strategies/instruction_decoder.inst_opcode.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_opcode.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_opcode.0/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.6/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct7.6'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct7.6/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct7.6/pdr/status: strategies/instruction_decoder.inst_funct7.6/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct7.6'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.6/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.6/smt_induction/status: strategies/instruction_decoder.inst_funct7.6/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct7.6'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.6/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.5/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct7.5'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct7.5/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct7.5/pdr/status: strategies/instruction_decoder.inst_funct7.5/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct7.5'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.5/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.5/smt_induction/status: strategies/instruction_decoder.inst_funct7.5/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct7.5'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.5/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.4/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct7.4'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct7.4/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct7.4/pdr/status: strategies/instruction_decoder.inst_funct7.4/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct7.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.4/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.4/smt_induction/status: strategies/instruction_decoder.inst_funct7.4/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct7.4'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.4/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.3/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct7.3'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct7.3/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct7.3/pdr/status: strategies/instruction_decoder.inst_funct7.3/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct7.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.3/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.3/smt_induction/status: strategies/instruction_decoder.inst_funct7.3/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct7.3'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.3/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct7.2'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct7.2/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct7.2/pdr/status: strategies/instruction_decoder.inst_funct7.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct7.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.2/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.2/smt_induction/status: strategies/instruction_decoder.inst_funct7.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct7.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.2/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct7.1'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct7.1/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct7.1/pdr/status: strategies/instruction_decoder.inst_funct7.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct7.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.1/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.1/smt_induction/status: strategies/instruction_decoder.inst_funct7.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct7.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.1/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct7.0'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct7.0/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct7.0/pdr/status: strategies/instruction_decoder.inst_funct7.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct7.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.0/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct7.0/smt_induction/status: strategies/instruction_decoder.inst_funct7.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct7.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct7.0/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct3.2/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct3.2'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct3.2/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct3.2/pdr/status: strategies/instruction_decoder.inst_funct3.2/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct3.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct3.2/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct3.2/smt_induction/status: strategies/instruction_decoder.inst_funct3.2/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct3.2'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct3.2/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct3.1/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct3.1'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct3.1/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct3.1/pdr/status: strategies/instruction_decoder.inst_funct3.1/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct3.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct3.1/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct3.1/smt_induction/status: strategies/instruction_decoder.inst_funct3.1/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct3.1'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct3.1/smt_induction; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct3.0/quick_sat/status:
	@echo "Running strategy 'quick_sat' on 'instruction_decoder.inst_funct3.0'.."
	@bash -c "cd strategies/instruction_decoder.inst_funct3.0/quick_sat; source run.sh"

strategies/instruction_decoder.inst_funct3.0/pdr/status: strategies/instruction_decoder.inst_funct3.0/quick_sat/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'pdr' on 'instruction_decoder.inst_funct3.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct3.0/pdr; source run.sh"; \
	fi

strategies/instruction_decoder.inst_funct3.0/smt_induction/status: strategies/instruction_decoder.inst_funct3.0/pdr/status
	@if grep PASS $^ >/dev/null ; then \
		echo "PASS (cached)" > $@; \
	elif grep FAIL $^ >/dev/null ; then \
		echo "FAIL (cached)" > $@; \
	else \
		echo "Running strategy 'smt_induction' on 'instruction_decoder.inst_funct3.0'.."; \
		bash -c "cd strategies/instruction_decoder.inst_funct3.0/smt_induction; source run.sh"; \
	fi

.PHONY: all summary
all: strategies/instruction_decoder.inst_funct3.0/smt_induction/status strategies/instruction_decoder.inst_funct3.1/smt_induction/status strategies/instruction_decoder.inst_funct3.2/smt_induction/status strategies/instruction_decoder.inst_funct7.0/smt_induction/status strategies/instruction_decoder.inst_funct7.1/smt_induction/status strategies/instruction_decoder.inst_funct7.2/smt_induction/status strategies/instruction_decoder.inst_funct7.3/smt_induction/status strategies/instruction_decoder.inst_funct7.4/smt_induction/status strategies/instruction_decoder.inst_funct7.5/smt_induction/status strategies/instruction_decoder.inst_funct7.6/smt_induction/status strategies/instruction_decoder.inst_opcode.0/smt_induction/status strategies/instruction_decoder.inst_opcode.1/smt_induction/status strategies/instruction_decoder.inst_opcode.2/smt_induction/status strategies/instruction_decoder.inst_opcode.3/smt_induction/status strategies/instruction_decoder.inst_opcode.4/smt_induction/status strategies/instruction_decoder.inst_opcode.5/smt_induction/status strategies/instruction_decoder.inst_opcode.6/smt_induction/status strategies/instruction_decoder.inst_rd.0/smt_induction/status strategies/instruction_decoder.inst_rd.1/smt_induction/status strategies/instruction_decoder.inst_rd.2/smt_induction/status strategies/instruction_decoder.inst_rd.3/smt_induction/status strategies/instruction_decoder.inst_rd.4/smt_induction/status strategies/instruction_decoder.inst_rs1.0/smt_induction/status strategies/instruction_decoder.inst_rs1.1/smt_induction/status strategies/instruction_decoder.inst_rs1.2/smt_induction/status strategies/instruction_decoder.inst_rs1.3/smt_induction/status strategies/instruction_decoder.inst_rs1.4/smt_induction/status strategies/instruction_decoder.inst_rs2.0/smt_induction/status strategies/instruction_decoder.inst_rs2.1/smt_induction/status strategies/instruction_decoder.inst_rs2.2/smt_induction/status strategies/instruction_decoder.inst_rs2.3/smt_induction/status strategies/instruction_decoder.inst_rs2.4/smt_induction/status
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
