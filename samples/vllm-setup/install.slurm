#!/bin/bash -l
#SBATCH --job-name=qhpc-vllm-install
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=8G
#SBATCH --time=00:30:00
#SBATCH --output=vllm-install-%j.out

# Use the cluster Python and its glibc rather than a uv-managed Python.
module --force purge
module load StdEnv/2023 python/3.11.5
# python --version
# python -c 'import os; print(os.confstr("CS_GNU_LIBC_VERSION"))'

# LOG CUDA VERSION and driver version

# An optional first argument selects a different, new environment directory.
venv_dir="${1:-$HOME/.venvs/qhpc-vllm}"
if [[ -e "$venv_dir" ]]; then
    echo "Environment already exists: $venv_dir. Choose a new path as the first argument." >&2
    exit 1
fi

uv venv --python "$(command -v python)" "$venv_dir"

# The prebuilt llguidance wheel avoids Rust installation and compilation.
uv pip install --python "$venv_dir/bin/python" --only-binary llguidance \
    "llguidance==1.7.6" "vllm==0.33.0"


# Test for vllm
uv pip check --python "$venv_dir/bin/python"
"$venv_dir/bin/python" - <<'PY'
from importlib.metadata import version
import llguidance

print("llguidance imported successfully:", version("llguidance"))
print("vLLM installed:", version("vllm"))
PY

echo "Environment ready: $venv_dir"
