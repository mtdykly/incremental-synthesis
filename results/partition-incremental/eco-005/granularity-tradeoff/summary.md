# Granularity Trade-off: eco-005

| Method | Median runtime | Speedup | Time reduction | Area | Area overhead |
|---|---:|---:|---:|---:|---:|
| Full | 25.120 s | 1.000x | +0.00% | 30179.562 | +0.000% |
| Coarse incremental | 23.799 s | 1.056x | +5.26% | 30261.490 | +0.271% |
| Fine incremental | 5.635 s | 4.458x | +77.57% | 30178.498 | -0.004% |

## Reuse granularity

- Coarse dirty partitions: 1
- Fine dirty child regions: 1
- Fine reusable child regions: 8
- Fine potential frontend reuse ratio inside dirty coarse partitions: 86.67%

Nangate45 technology mapping is used only for area measurement and is not included in the reported runtime.
