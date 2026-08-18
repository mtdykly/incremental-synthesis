# Granularity Trade-off: cv32e40p-eco-001

| Method | Median runtime | Speedup | Time reduction | Area | Area overhead |
|---|---:|---:|---:|---:|---:|
| Full | 33.690 s | 1.000x | +0.00% | 52295.334 | +0.000% |
| Coarse incremental | 28.599 s | 1.178x | +15.11% | 54265.330 | +3.767% |
| Fine incremental | 20.788 s | 1.621x | +38.30% | 54174.890 | +3.594% |

## Reuse granularity

- Coarse dirty partitions: 1
- Fine dirty child regions: 1
- Fine reusable child regions: 4
- Fine potential frontend reuse ratio inside dirty coarse partitions: 45.44%

Nangate45 technology mapping is used only for area measurement and is not included in the reported runtime.
