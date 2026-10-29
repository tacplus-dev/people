# Roadmap: people

Owned by Jody; changed only by an agent at Jody's request. Loopers propose in PROPOSALS.md.

## Now
The people service: the identity graph (XIDs, links, memberships) in the reserved `people` tenant (00000001), on flock (fleet-wide, generated, Rust); kernel reads it through the generated state clients.
Unreleased; no code yet (README and LICENSE only). Kernel's `IdentityGraph` on kernel state stands in until this replaces it.

## Next
- Nothing unblocked yet.

## Later
- The people table on flock (#1), after tacplus-dev/tacplus#206 and tacplus-dev/tacplus#204
- Release: tag v0.1.0 and publish the image (#2), after #1 and tacplus-dev/looper#12
- Remove a deleted tenant's memberships; people stay (tacplus-dev/roadmap:decisions/tenant-deletion-2026-10-27.md)
- XID ageing: an XID not signed in for about a year is deleted like DeleteAccount (tacplus-dev/roadmap:decisions/tenant-deletion-2026-10-27.md)
- Whether org memberships live here or with each org tenant (needs Jody's decision; tacplus-dev/roadmap:decisions/stratum-per-tenant-2026-10-25.md, Open)

## Not doing
- Shared state with kernel: kernel reaches this service only through the tacplus-generated S2S client (decisions/stratum-per-tenant-2026-10-25.md)
