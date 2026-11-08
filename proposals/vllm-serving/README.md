# vLLM Serving Performance - Incomplete

Drafted by: Anthony Botticchio

## Overview

How does concurrent generation affect vLLM throughput, responsiveness, and KV-cache pressure? This project develops practical inference and benchmarking skills for QHPC members. Please see vLLM documentation for a basic understanding before continuing: https://vllm.ai


## Goals and scope

Build a simple serving interface and finish one reproducible experiment with one model on one machine. Larger models, shared-prefix experiments, comparisons with other engines, and source-code investigation are later extensions. Multi-GPU deployment and an always-on public service are outside the first version.

Always-on service is likely not in the scope of our work unless we had a node completely reserved for ourselves. Unfortunately, we are limited by the time spent on the frnt201 L4 GPUs.

## Proposed approach

**Hypothesis:** Increasing concurrency initially improves total throughput; eventually gains diminish and latency increases. KV-cache pressure may cause preemption and recomputation.

Use vLLM's benchmark tools to compare 1, 2, 4, and 8 concurrent requests. Hold hardware, model, precision, prompt/output token lengths, and generation settings fixed. Repeat after warm-up and control prefix-cache reuse.

Distinguish memory capacity from bandwidth, and prefix-cache misses from request preemptions. PagedAttention manages mapped KV blocks; “PagedAttention faults” is not a sufficiently defined event to measure. Client-network and distributed-worker communication limits are separate investigations.

## Required resources

vLLM, a small supported model, and compatible computing resources. Plan for the CAC and club node `frnt201` where suitable. GPU specifications/access, model choice, compute time, storage, and cost: **TBD**. Additional hardware requests go to the QHPC presidents for discussion and budgeting.

## Feasibility and milestones

Confirm resources and run a baseline; complete the concurrency sweep; analyse and demonstrate results. Participants and effort: **TBD**. Main dependencies are compatible hardware, model fit, and member availability.

## Success criteria

Save configuration, commands, and measurements. Report output tokens/second, median/p95 first-token and full-response latency, failures, KV-cache usage, and preemptions. Present a few plots explaining conclusions and anomalies. A throughput plateau alone does not prove a bandwidth bottleneck; attribution needs profiling evidence.

## Implementation repository

**TBD** — implementation belongs in a separate QHPC GitHub organization repository.

## Resources and inspiration

- [CAC environment setup sample](../../samples/vllm-setup/README.md): install vLLM with the cluster Python using a Slurm job.
- Kwon et al. (2023), [*Efficient Memory Management for Large Language Model Serving with PagedAttention*](https://arxiv.org/abs/2309.06180): background reading on KV-block management.
- [vLLM benchmarks](https://docs.vllm.ai/en/stable/benchmarking/cli/): measurement tools and methodology.
- [vLLM preemption](https://docs.vllm.ai/en/stable/configuration/optimization/#preemption): interpreting cache-capacity pressure.

## Open questions and next steps

Confirm available hardware and access, then select a fitting model and agree on the first experiment. No workloads or benchmarks have been run for this proposal.
