# A-F Area Overhead Analysis: eco-004

| ID | Method | Area | Δ vs A | Overhead | Comb | Seq | Cells | Recovery |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| A | Full | 30661.820 | +0.000 | +0.000% | 25043.900 | 5617.920 | 22390 | — |
| B | Incremental | 30842.434 | +180.614 | +0.589% | 25224.514 | 5617.920 | 22503 | 0.00% |
| C | Incremental + global mapping | 30796.948 | +135.128 | +0.441% | 25179.028 | 5617.920 | 22536 | 25.18% |
| D | Incremental + global resynth + mapping | 30675.918 | +14.098 | +0.046% | 25057.998 | 5617.920 | 22460 | 92.19% |
| E | Full resynth control | 30738.694 | +76.874 | +0.251% | 25120.774 | 5617.920 | 23205 | — |
| F | Pre-synth linked + global synth + mapping | 30801.736 | +139.916 | +0.456% | 25183.816 | 5617.920 | 22759 | 22.53% |

## Experiment meanings

- **A**: Full synthesis baseline.
- **B**: Partition incremental synthesis.
- **C**: B with partition mapping boundaries removed before global technology mapping.
- **D**: Synthesized partitions are linked, flattened, globally re-synthesized, then globally mapped.
- **E**: Full design is synthesized for a second time; this is a control, not a recovery stage.
- **F**: Partitions are linked before independent generic synthesis, followed by one global synthesis and one global mapping.

The recovery trend should therefore be interpreted as **B → C → D → F**. A is the baseline and E is the full-resynthesis control.
