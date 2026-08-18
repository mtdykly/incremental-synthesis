# A-F Area Overhead Analysis: eco-002

| ID | Method | Area | Δ vs A | Overhead | Comb | Seq | Cells | Recovery |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| A | Full | 11416.720 | +0.000 | +0.000% | 6786.192 | 4630.528 | 6411 | — |
| B | Incremental | 11609.304 | +192.584 | +1.687% | 6978.776 | 4630.528 | 6322 | 0.00% |
| C | Incremental + global mapping | 11515.140 | +98.420 | +0.862% | 6884.612 | 4630.528 | 6584 | 48.90% |
| D | Incremental + global resynth + mapping | 11309.256 | -107.464 | -0.941% | 6678.728 | 4630.528 | 6241 | 155.80% |
| E | Full resynth control | 11402.090 | -14.630 | -0.128% | 6771.562 | 4630.528 | 6244 | — |
| F | Pre-synth linked + global synth + mapping | 11307.394 | -109.326 | -0.958% | 6676.866 | 4630.528 | 6476 | 156.77% |

## Experiment meanings

- **A**: Full synthesis baseline.
- **B**: Partition incremental synthesis.
- **C**: B with partition mapping boundaries removed before global technology mapping.
- **D**: Synthesized partitions are linked, flattened, globally re-synthesized, then globally mapped.
- **E**: Full design is synthesized for a second time; this is a control, not a recovery stage.
- **F**: Partitions are linked before independent generic synthesis, followed by one global synthesis and one global mapping.

The recovery trend should therefore be interpreted as **B → C → D → F**. A is the baseline and E is the full-resynthesis control.
