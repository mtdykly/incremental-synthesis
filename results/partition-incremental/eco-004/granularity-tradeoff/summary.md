# Granularity Trade-off: eco-004

| Method | Median runtime | Speedup | Time reduction | Area | Area overhead |
|---|---:|---:|---:|---:|---:|
| Full | 25.980 s | 1.000x | +0.00% | 30661.820 | +0.000% |
| Coarse incremental | 3.698 s | 7.026x | +85.77% | 30842.434 | +0.589% |
| Fine incremental | 4.088 s | 6.355x | +84.26% | 30841.636 | +0.586% |

## Reuse granularity

- Coarse dirty partitions: 1
- Fine dirty child regions: 2
- Fine reusable child regions: 1
- Fine potential frontend reuse ratio inside dirty coarse partitions: 8.26%

Nangate45 technology mapping is used only for area measurement and is not included in the reported runtime.
