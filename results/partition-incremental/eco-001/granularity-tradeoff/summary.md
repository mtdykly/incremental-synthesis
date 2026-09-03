# Granularity Trade-off: eco-001

| Method | Median runtime | Speedup | Time reduction | Area | Area overhead |
|---|---:|---:|---:|---:|---:|
| Full | 2.340 s | 1.000x | +0.00% | 11386.396 | +0.000% |
| Coarse incremental | 2.266 s | 1.032x | +3.15% | 11640.426 | +2.231% |
| Fine incremental | 2.444 s | 0.957x | -4.46% | 11643.086 | +2.254% |

## Reuse granularity

- Coarse dirty partitions: 1
- Fine dirty child regions: 1
- Fine reusable child regions: 2
- Fine potential frontend reuse ratio inside dirty coarse partitions: 91.45%

Nangate45 technology mapping is used only for area measurement and is not included in the reported runtime.
