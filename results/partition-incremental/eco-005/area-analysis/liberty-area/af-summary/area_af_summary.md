# A-F Area Overhead Analysis: eco-005

| ID | Method | Area | Δ vs A | Overhead | Comb | Seq | Cells | Recovery |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| A | Full | 30179.562 | +0.000 | +0.000% | 25523.498 | 4656.064 | 22372 | — |
| B | Incremental | 30261.490 | +81.928 | +0.271% | 25605.426 | 4656.064 | 22307 | 0.00% |
| C | Incremental + global mapping | 30004.002 | -175.560 | -0.582% | 25347.938 | 4656.064 | 22462 | 314.29% |
| D | Incremental + global resynth + mapping | 29737.204 | -442.358 | -1.466% | 25081.140 | 4656.064 | 22249 | 639.94% |
| E | Full resynth control | 30067.310 | -112.252 | -0.372% | 25411.246 | 4656.064 | 22453 | — |
| F | Pre-synth linked + global synth + mapping | 30049.754 | -129.808 | -0.430% | 25393.690 | 4656.064 | 22772 | 258.44% |

## Experiment meanings

- **A**: Full synthesis baseline.
- **B**: Partition incremental synthesis.
- **C**: B with partition mapping boundaries removed before global technology mapping.
- **D**: Synthesized partitions are linked, flattened, globally re-synthesized, then globally mapped.
- **E**: Full design is synthesized for a second time; this is a control, not a recovery stage.
- **F**: Partitions are linked before independent generic synthesis, followed by one global synthesis and one global mapping.

The recovery trend should therefore be interpreted as **B → C → D → F**. A is the baseline and E is the full-resynthesis control.
