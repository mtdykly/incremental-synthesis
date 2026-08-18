# Granularity Trade-off: eco-008

| Method | Median runtime | Speedup | Time reduction | Area | Area overhead |
|---|---:|---:|---:|---:|---:|
| Full | 21.640 s | 1.000x | +0.00% | 30061.990 | +0.000% |
| Coarse incremental | 2.619 s | 8.264x | +87.90% | 30314.690 | +0.841% |
| Fine incremental | 2.146 s | 10.083x | +90.08% | 30314.690 | +0.841% |

## Reuse granularity

- Coarse dirty partitions: 0
- Fine dirty child regions: 0
- Fine reusable child regions: 0
- Fine potential frontend reuse ratio inside dirty coarse partitions: 0.00%

Nangate45 technology mapping is used only for area measurement and is not included in the reported runtime.
