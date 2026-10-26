# people

The people service: the identity graph, in the `people` tenant, on that tenant's Stratum.

It owns XIDs (a human is `spiffe://<td>/users/<xid>`), the `(idp_id, provider_subject)` links that resolve
to them, and each person's tenant memberships: the first-login create, a membership the first time an org
routes a person, Link (merge), Unlink, delete account and sign out everywhere, and the two reads every
token mint makes. Kernel keeps what is stateless (the session credential, its proofs, the per-tenant
exchange) and calls this service. The contract is kernel's `IdentityGraph`
(github.com/tacplus-dev/kernel, `server/.../cluster/IdentityGraph.java`), implemented there on kernel
state until this service replaces it.

Decision records: `identity-session-credential-2026-10-25` and `stratum-per-tenant-2026-10-25`
(schematic roadmap). Work arrives as issues; see github.com/tacplus-dev/looper.
