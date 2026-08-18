# Granularity Trade-off: eco-003

| Method | Median runtime | Speedup | Time reduction | Area | Area overhead |
|---|---:|---:|---:|---:|---:|
| Full | 26.120 s | 1.000x | +0.00% | 30768.486 | +0.000% |
| Coarse incremental | 3.643 s | 7.169x | +86.05% | 30786.042 | +0.057% |
| Fine incremental | 3.985 s | 6.555x | +84.74% | 30784.978 | +0.054% |

## Reuse granularity

- Coarse dirty partitions: 1
- Fine dirty child regions: 2
- Fine reusable child regions: 1
- Fine potential frontend reuse ratio inside dirty coarse partitions: 20.16%

Nangate45 technology mapping is used only for area measurement and is not included in the reported runtime.
