# End-to-End Workflow

This document walks through a single, complete cycle of Praheri.AI's decision pipeline, from raw data observation to an investor-facing action — illustrating how the architecture described in `architecture/README.md` operates in sequence.

## Step 1 — Consent and Baseline Setup

Before any monitoring begins, the investor selects which data signals Praheri.AI may observe and sets a personal autonomy profile defining what the system may act on directly versus what always requires their confirmation. Over an initial baseline period, the Sentinel Agent observes the investor's typical SIP timing, trade frequency, and risk profile without taking any visible action.

## Step 2 — Trigger Detection

The Sensing Layer and Behavioral Modeling Engine continuously process incoming data. When a meaningful deviation occurs — for example, two consecutive SIP failures, or a trade timed suspiciously close to a social-media spike in interest for the same stock — the deviation is flagged for evaluation.

## Step 3 — Sentinel Proposal

The Sentinel Agent evaluates the flagged deviation in the context of the investor's baseline and drafts a structured proposal: what was observed, why it likely matters, what action is recommended, and how urgent and confident that recommendation is. See `agents/sentinel.md` for the full specification.

## Step 4 — Skeptic Review

Before the proposal can proceed, the Skeptic Agent independently reviews it — actively searching for an alternative explanation, a false-positive risk, or a proportionality concern. Only proposals that survive this review continue to the next step; rejected proposals are logged and discarded. See `agents/skeptic.md`.

## Step 5 — Guardian Authorization

The Guardian Agent, a deterministic rule-based engine, evaluates the surviving proposal against SEBI compliance boundaries, the investor's autonomy settings, and current market-volatility conditions. It assigns one of three execution tiers: auto-execute (for low-risk, informational actions), confirm-required (for anything with financial consequence), or escalate-to-human (for ambiguous or high-stakes cases). See `agents/guardian.md`.

## Step 6 — Action Execution

Depending on the assigned tier:

- **Auto-execute:** An informational nudge is sent immediately, accompanied by a Counterfactual Receipt explaining what would likely have happened without the system's observation.
- **Confirm-required:** A one-tap action (e.g., a 60-day SIP pause) is proposed to the investor; nothing executes without their explicit approval.
- **Escalate-to-human:** The case routes directly to a compliance officer or licensed advisor queue, prioritized above unfiltered alerts precisely because it has already passed Skeptic and Guardian review.

## Step 7 — Logging and Feedback

Every step of this cycle — including the Sentinel's full reasoning, the Skeptic's specific objections or validation, and the Guardian's policy basis for its decision — is recorded in the Explainability & Audit Layer. The investor's response to any confirm-required action feeds back into their behavioral model, refining future Sentinel evaluations.

## Step 8 — Periodic Trust Reporting

On a recurring basis, investors and compliance teams receive a plain-language summary of everything the system observed, proposed, challenged, and acted on during the period — reinforcing that the system's autonomy is paired with transparency, not opacity.
