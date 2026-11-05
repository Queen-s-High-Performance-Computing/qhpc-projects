# vLLM environment setup on the CAC

[install.slurm](install.slurm) installs vLLM 0.33.0 and llguidance 1.7.6 using the cluster's `StdEnv/2023` and `python/3.11.5` modules. The module Python used glibc 2.37 in the setup check; the original virtual environment used the host's glibc 2.28. Selecting the module Python and a prebuilt llguidance wheel resolved that dependency's installation and import. Rust is unnecessary for this wheel-based step.

Requires CAC access, `uv` on `PATH`, the listed modules, internet access from the allocated node, and storage for the environment and package cache. This job only installs packages; it does not request a GPU, download a model, or run inference. Resource requests are starting values; adjust time, memory, account, and partition for your allocation.

From the repository root **on the CAC**, submit:

```bash
sbatch samples/vllm-setup/install.slurm
```

The default environment is `~/.venvs/qhpc-vllm`. To keep an existing environment, pass a different, new path:

```bash
sbatch samples/vllm-setup/install.slurm "$HOME/.venvs/qhpc-vllm-test"
```

Check `vllm-install-JOBID.out` for a successful dependency check, `llguidance imported successfully: 1.7.6`, and `vLLM installed: 0.33.0`. These check installation and the llguidance import; vLLM runtime and hardware compatibility still need a separate check on suitable allocated hardware. The batch script has not been run on the CAC.

In later sessions, load the same modules before activating the environment:

```bash
module load StdEnv/2023 python/3.11.5
source "$HOME/.venvs/qhpc-vllm/bin/activate"
```

References: [uv environments](https://docs.astral.sh/uv/pip/environments/), [uv binary-only installation](https://docs.astral.sh/uv/pip/compatibility/#only-binary-enforcement), [llguidance wheels](https://pypi.org/project/llguidance/1.7.6/#files), [vLLM 0.33.0](https://pypi.org/project/vllm/0.33.0/), and [Slurm batch submission](https://slurm.schedmd.com/sbatch.html).
