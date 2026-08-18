# Granularity Trade-off: eco-002

| Method | Median runtime | Speedup | Time reduction | Area | Area overhead |
|---|---:|---:|---:|---:|---:|
| Full | 2.350 s | 1.000x | +0.00% | 11416.720 | +0.000% |
| Coarse incremental | 4.081 s | 0.576x | -73.67% | 11609.304 | +1.687% |
| Fine incremental | 3.142 s | 0.748x | -33.69% | 11503.702 | +0.762% |

## Reuse granularity

- Coarse dirty partitions: 1
- Fine dirty child regions: 1
- Fine reusable child regions: 10
- Fine potential frontend reuse ratio inside dirty coarse partitions: 96.00%

Nangate45 technology mapping is used only for area measurement and is not included in the reported runtime.
