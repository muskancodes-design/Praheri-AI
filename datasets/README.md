# Datasets

This directory contains the synthetic data used to develop and demonstrate Praheri.AI during Phase 1. **No real investor data is used anywhere in this prototype.** All records are generated and clearly fictional — names, identifiers, and transaction patterns are constructed to exercise the system's logic, not to represent real individuals.

## Why Synthetic Data

A hackathon prototype has no legitimate basis for handling real financial data, and Praheri.AI's own design principles (consent-first data access, Account Aggregator-based income signals) require infrastructure that doesn't exist in a Phase 1 context. Synthetic data lets the agent pipeline, behavioral modeling, and UI be built and demonstrated honestly, without overstating what has actually been validated.

## Files

| File | Description |
|---|---|
| `sample_transactions.csv` | Synthetic buy/sell transaction records across a small set of fictional investors, including some trades deliberately clustered in time to simulate herd-driven trading patterns for Behavioral Immunity Score testing |

Additional synthetic files referenced in the architecture documentation (`investors.csv`, `sip_records.csv`, `nominations.csv`) are planned alongside Milestone M1 (data layer) and are not yet included in this directory — see the root repository roadmap for status.

## Generation Approach

The dataset included here was constructed manually for Phase 1 demonstration purposes. A configurable generator script (planned, not yet built) is intended to replace this manual file in Phase 2, allowing variable investor counts, SIP failure rates, and trade-timing clustering for more rigorous testing of the Sentinel Agent and Behavioral Immunity Score logic.

## Schema Notes

`sample_transactions.csv` columns:

- `transaction_id` — unique identifier for the transaction
- `investor_id` — references a fictional investor (not a separate investors file in this initial sample)
- `instrument` — the traded security, fictional or genericized
- `transaction_type` — `buy` or `sell`
- `amount` — transaction value in INR
- `executed_at` — ISO 8601 timestamp of execution

This schema is intended to map directly to the `transactions` table defined in the backend's planned database schema (see `architecture/README.md`).
