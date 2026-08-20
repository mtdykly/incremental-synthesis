# Partition-Incremental Scripts

`partition-incremental/scripts/` has been split so the top level only keeps the main entry points, while lower-level helpers live in dedicated subdirectories.

## Top-Level Entry Points

These are the scripts you are most likely to run directly:

- `validate_signature_case.sh`
  - Build Base cache, compute New signatures, and generate a reuse plan.
- `prepare_new_reuse_plan.sh`
  - Recompute only the New-side reuse plan from an existing Base cache.
- `build_incremental_design.sh`
  - Build the linked incremental design from an existing reuse plan.
- `run_new_incremental_synthesis.sh`
  - Run reuse-plan generation and incremental build in one command.
- `run_profiled_incremental_synthesis.sh`
  - Same core flow as above, but with stage-by-stage timing output.
- `validate_incremental_design.sh`
  - Validate reused or rebuilt artifacts against independently generated references.
- `benchmark_full_vs_incremental_profiled.sh`
  - Compare full synthesis and incremental synthesis runtime.
- `benchmark_granularity_tradeoff.sh`
  - Explore coarse versus fine-grained reuse tradeoffs.
- `build_fine_incremental_design.sh`
  - Build the fine-grained incremental design after fine reuse planning.

## Internal Helper Groups

### `pipeline/`

Lower-level build and synthesis helpers used by the entry-point scripts:

- hierarchy export
- partition extraction
- isolated partition frontend generation
- partition synthesis
- top-shell synthesis
- partition linking
- partition materialization

Representative files:

- `pipeline/export_hierarchy.sh`
- `pipeline/prepare_partition_frontend.sh`
- `pipeline/synth_partition.sh`
- `pipeline/synth_top_shell.sh`
- `pipeline/link_partitions.sh`

### `planning/`

Helpers for reuse planning and fine-grained cache decisions:

- partition signature computation and comparison
- fine-region extraction
- fine-grained manifest construction
- diagnosis helpers for signature mismatches

Representative files:

- `planning/compute_partition_signatures.py`
- `planning/compare_partition_signatures.py`
- `planning/extract_fine_regions.py`
- `planning/build_fine_partition_manifest.py`

### `checks/`

Validation and structural consistency checks:

- linked-design checks
- partition-output checks
- top-shell structure verification
- EQY-based partition verification

Representative files:

- `checks/check_linked_design.sh`
- `checks/check_partition_outputs.sh`
- `checks/verify_partition_with_eqy.sh`
- `checks/verify_top_shell_structure.py`

## Practical Rule of Thumb

If you are unsure where to start:

- want to run the normal incremental flow: start with top-level scripts
- want to inspect how one stage works internally: look in `pipeline/`
- want to understand why a partition is reusable or dirty: look in `planning/`
- want to verify correctness or debug a mismatch: look in `checks/`

## Compatibility Note

The public entry-point command paths under `partition-incremental/scripts/` were kept stable. The main refactor is internal organization, so existing documented high-level commands still work after the path updates.
