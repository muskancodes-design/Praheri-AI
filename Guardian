# Guardian Agent

## Role

The Guardian Agent is the system's compliance and consent enforcer, and the only component in the pipeline permitted to authorize an action. It is deliberately **not** a language model. It is a deterministic, rule-based policy engine — a design choice that exists specifically so that no generative model's unpredictability can directly reach a financially consequential action.

## Inputs

- The Sentinel Agent's proposal
- The Skeptic Agent's verdict and any tier-downgrade recommendation
- The investor's stored consent and autonomy settings
- Current market volatility status (for Volatility Cooling-Off Mode evaluation)
- A configurable JSON rule set encoding SEBI compliance boundaries

## Output

```json
{
  "execution_tier": "auto_execute | confirm_required | escalate_human | rejected",
  "policy_basis": "string — which specific rule(s) determined this outcome",
  "cooling_off_applied": "boolean"
}
```

## Decision Logic (Representative, Not Exhaustive)

The Guardian Agent evaluates a fixed sequence of checks against every Skeptic-approved proposal:

1. **Skeptic verdict check** — a `reject` verdict halts the pipeline immediately; the proposal is logged and discarded.
2. **Financial-consequence check** — any action that would move money, pause/cancel a mandate, or alter holdings is hard-capped at `confirm_required` at minimum, regardless of Sentinel/Skeptic confidence. No exceptions are configurable for this rule.
3. **Investor autonomy preference check** — if the investor has set a stricter autonomy tier than the proposal would otherwise warrant (e.g., "always ask me, never auto-execute anything"), the investor's preference overrides the default policy.
4. **Volatility Cooling-Off check** — if the market is in a SEBI-flagged high-volatility window, non-essential informational nudges are suppressed or delayed, and only protective actions (e.g., a pause proposal, not a promotional nudge) are permitted to proceed.
5. **Regulatory-advice boundary check** — any proposal that would constitute investment advice in the SEBI-regulated sense is routed to `escalate_human`, never auto-executed or self-confirmed, since Praheri.AI does not position itself as a substitute for a registered investment adviser.

## What the Guardian Agent Is Not Permitted to Do

- It cannot generate new reasoning or modify the substance of a proposal — it only classifies and authorizes (or rejects) what the Sentinel/Skeptic pipeline produced.
- It cannot be overridden by a Sentinel or Skeptic confidence score; its rule evaluation is final within the pipeline.
- It does not call any external AI model — this is intentional, to keep the authorization step fully deterministic, testable, and explainable in plain rule terms for a regulator.

## Implementation Status

Not yet implemented. Tracked as Milestone M4, dependent on Milestones M2 and M3. See `backend/app/agents/guardian_agent.py` and `backend/app/services/policy_engine.py` for the corresponding (currently unimplemented) modules. Given its role as the system's core safety boundary, any future PR touching this component requires review from at least two maintainers (see root `CONTRIBUTING.md`).
