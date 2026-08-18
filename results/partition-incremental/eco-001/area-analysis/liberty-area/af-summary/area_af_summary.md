# A-F Area Overhead Analysis: eco-001

| ID | Method | Area | Δ vs A | Overhead | Comb | Seq | Cells | Recovery |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| A | Full | 11386.396 | +0.000 | +0.000% | 6730.332 | 4656.064 | 6212 | — |
| B | Incremental | 11640.426 | +254.030 | +2.231% | 6984.362 | 4656.064 | 6372 | 0.00% |
| C | Incremental + global mapping | 11512.214 | +125.818 | +1.105% | 6856.150 | 4656.064 | 6375 | 50.47% |
| D | Incremental + global resynth + mapping | 11290.902 | -95.494 | -0.839% | 6634.838 | 4656.064 | 6053 | 137.59% |
| E | Full resynth control | 11411.400 | +25.004 | +0.220% | 6755.336 | 4656.064 | 6275 | — |
| F | Pre-synth linked + global synth + mapping | 11340.378 | -46.018 | -0.404% | 6684.314 | 4656.064 | 6448 | 118.12% |

## Experiment meanings

- **A**: Full synthesis baseline.
- **B**: Partition incremental synthesis.
- **C**: B with partition mapping boundaries removed before global technology mapping.
- **D**: Synthesized partitions are linked, flattened, globally re-synthesized, then globally mapped.
- **E**: Full design is synthesized for a second time; this is a control, not a recovery stage.
- **F**: Partitions are linked before independent generic synthesis, followed by one global synthesis and one global mapping.

The recovery trend should therefore be interpreted as **B → C → D → F**. A is the baseline and E is the full-resynthesis control.
