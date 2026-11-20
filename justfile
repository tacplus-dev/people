# The gates the build pipeline runs (`just gates`, in the image build.lock pins, without Docker) and a land runs.
# No code yet: the planning files are present (as the planning-files workflow checks), and the pin names its image
# by digest (as looper-build plan validates it).
gates:
    #!/usr/bin/env bash
    set -euo pipefail
    rc=0
    for f in STATE.md PROPOSALS.md HISTORY.md ROADMAP.md; do
      [[ -f "$f" ]] || { echo "gates: $f is missing" >&2; rc=1; }
    done
    image="$(sed -n 's/^build_image:[[:space:]]*\([^[:space:]]*\)[[:space:]]*$/\1/p' build.lock | head -1)"
    [[ "$image" =~ ^[^@[:space:]]+@sha256:[0-9a-f]{64}$ ]] ||
      { echo "gates: build.lock: build_image '$image' must name the image by digest (<name>[:<tag>]@sha256:<64 hex>)" >&2; rc=1; }
    ((rc == 0)) && echo "gates: ok"
    exit "$rc"
