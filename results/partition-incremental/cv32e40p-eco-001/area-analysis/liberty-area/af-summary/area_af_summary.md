# A-F Area Overhead Analysis: cv32e40p-eco-001

| ID | Method | Area | Δ vs A | Overhead | Comb | Seq | Cells | Recovery |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| A | Full | 52295.334 | +0.000 | +0.000% | 38915.534 | 13379.800 | 36188 | — |
| B | Incremental | 54265.330 | +1969.996 | +3.767% | 40715.290 | 13550.040 | 37598 | 0.00% |
| C | Incremental + global mapping | 53500.580 | +1205.246 | +2.305% | 39955.860 | 13544.720 | 37625 | 38.82% |
| D | Incremental + global resynth + mapping | 53106.900 | +811.566 | +1.552% | 39753.700 | 13353.200 | 37464 | 58.80% |
| E | Full resynth control | 52332.308 | +36.974 | +0.071% | 38957.828 | 13374.480 | 36320 | — |
| F | Pre-synth linked + global synth + mapping | 53389.658 | +1094.324 | +2.093% | 40015.178 | 13374.480 | 37738 | 44.45% |

## Experiment meanings

- **A**: Full synthesis baseline.
- **B**: Partition incremental synthesis.
- **C**: B with partition mapping boundaries removed before global technology mapping.
- **D**: Synthesized partitions are linked, flattened, globally re-synthesized, then globally mapped.
- **E**: Full design is synthesized for a second time; this is a control, not a recovery stage.
- **F**: Partitions are linked before independent generic synthesis, followed by one global synthesis and one global mapping.

The recovery trend should therefore be interpreted as **B → C → D → F**. A is the baseline and E is the full-resynthesis control.
