# A-F Area Overhead Analysis: eco-003

| ID | Method | Area | Δ vs A | Overhead | Comb | Seq | Cells | Recovery |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| A | Full | 30768.486 | +0.000 | +0.000% | 25150.566 | 5617.920 | 22939 | — |
| B | Incremental | 30786.042 | +17.556 | +0.057% | 25168.122 | 5617.920 | 22806 | 0.00% |
| C | Incremental + global mapping | 30723.798 | -44.688 | -0.145% | 25105.878 | 5617.920 | 22679 | 354.55% |
| D | Incremental + global resynth + mapping | 30696.932 | -71.554 | -0.233% | 25079.012 | 5617.920 | 22731 | 507.58% |
| E | Full resynth control | 30735.502 | -32.984 | -0.107% | 25117.582 | 5617.920 | 22565 | — |
| F | Pre-synth linked + global synth + mapping | 30731.246 | -37.240 | -0.121% | 25113.326 | 5617.920 | 22822 | 312.12% |

## Experiment meanings

- **A**: Full synthesis baseline.
- **B**: Partition incremental synthesis.
- **C**: B with partition mapping boundaries removed before global technology mapping.
- **D**: Synthesized partitions are linked, flattened, globally re-synthesized, then globally mapped.
- **E**: Full design is synthesized for a second time; this is a control, not a recovery stage.
- **F**: Partitions are linked before independent generic synthesis, followed by one global synthesis and one global mapping.

The recovery trend should therefore be interpreted as **B → C → D → F**. A is the baseline and E is the full-resynthesis control.
