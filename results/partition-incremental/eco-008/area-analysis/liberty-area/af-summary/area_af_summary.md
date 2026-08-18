# A-F Area Overhead Analysis: eco-008

| ID | Method | Area | Δ vs A | Overhead | Comb | Seq | Cells | Recovery |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| A | Full | 30061.990 | +0.000 | +0.000% | 25405.926 | 4656.064 | 22227 | — |
| B | Incremental | 30314.690 | +252.700 | +0.841% | 25658.626 | 4656.064 | 22498 | 0.00% |
| C | Incremental + global mapping | 30161.740 | +99.750 | +0.332% | 25505.676 | 4656.064 | 22586 | 60.53% |
| D | Incremental + global resynth + mapping | 29867.278 | -194.712 | -0.648% | 25211.214 | 4656.064 | 22399 | 177.05% |
| E | Full resynth control | 29911.168 | -150.822 | -0.502% | 25255.104 | 4656.064 | 22706 | — |
| F | Pre-synth linked + global synth + mapping | 29902.656 | -159.334 | -0.530% | 25246.592 | 4656.064 | 22692 | 163.05% |

## Experiment meanings

- **A**: Full synthesis baseline.
- **B**: Partition incremental synthesis.
- **C**: B with partition mapping boundaries removed before global technology mapping.
- **D**: Synthesized partitions are linked, flattened, globally re-synthesized, then globally mapped.
- **E**: Full design is synthesized for a second time; this is a control, not a recovery stage.
- **F**: Partitions are linked before independent generic synthesis, followed by one global synthesis and one global mapping.

The recovery trend should therefore be interpreted as **B → C → D → F**. A is the baseline and E is the full-resynthesis control.
