# Granularity Trade-off: eco-006

| Method | Median runtime | Speedup | Time reduction | Area | Area overhead |
|---|---:|---:|---:|---:|---:|
| Full | 21.370 s | 1.000x | +0.00% | 30061.990 | +0.000% |
| Coarse incremental | 21.202 s | 1.008x | +0.78% | 30314.690 | +0.841% |
| Fine incremental | 4.964 s | 4.305x | +76.77% | 30176.370 | +0.380% |

## Reuse granularity

- Coarse dirty partitions: 3
- Fine dirty child regions: 2
- Fine reusable child regions: 9
- Fine potential frontend reuse ratio inside dirty coarse partitions: 88.24%

Nangate45 technology mapping is used only for area measurement and is not included in the reported runtime.
