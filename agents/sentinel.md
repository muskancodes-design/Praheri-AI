# Sentinel Agent

## Role

The Sentinel Agent is the system's continuous observer. It does not wait to be invoked by a user — it runs against each investor's data on a scheduled or event-triggered basis and is responsible for noticing when something in an investor's behavior or account status deviates meaningfully from their established baseline, and for proposing a reasoned response.

## Inputs

- The investor's behavioral baseline (typical SIP timing, historical trade size/frequency, stated risk profile)
- Recent transaction history
- SIP and mandate status (including consecutive failure count)
- KYC/nomination status
- Market volatility index (current state)
- Consent-gated income signal, where the investor has granted Account Aggregator access (Phase 2)

## Output

A structured JSON proposal:

```json
{
  "trigger": "string — what was observed",
  "reasoning": "string — why this matters, in context",
  "recommended_action": "string — the specific proposed action",
  "urgency": "low | medium | high",
  "confidence": "float, 0.0-1.0"
}
```

## Example Reasoning (Illustrative, Not a Guaranteed Output)

> Trigger: Two consecutive SIP failures on the Flexi Cap Growth Fund mandate.
> Reasoning: No corresponding market-wide disruption was detected in the same window, and the investor's transaction history shows no other unusual activity. Combined with a slight delay in this month's typical salary-credit timing (where income visibility is consented), this pattern is more consistent with a temporary cash-flow gap than deliberate discontinuation.
> Recommended action: Propose a 60-day SIP pause instead of allowing a third failure to trigger mandate cancellation, and surface this clearly to the investor with their consent required before execution.
> Urgency: medium
> Confidence: 0.78

## What the Sentinel Agent Is Not Permitted to Do

- It cannot execute any action directly. Its output is a *proposal*, not a command.
- It cannot bypass the Skeptic Agent. Every Sentinel proposal must pass through adversarial review before it can proceed.
- It does not have access to instruments for placing trades, modifying mandates, or altering account settings — it only has read access to the data sources listed above.

## Prompting Approach

The Sentinel Agent is implemented as a single Claude API call per evaluation cycle, with a system prompt that frames the task explicitly as financial-pattern interpretation grounded in the specific investor's own historical baseline — not generic financial advice generation. The prompt requires the model to cite the specific data points that led to its conclusion, which both improves output quality and gives the Skeptic Agent concrete claims to interrogate.

## Implementation Status

Not yet implemented. Tracked as Milestone M2. See `backend/app/agents/sentinel_agent.py` for the corresponding (currently unimplemented) module and `backend/app/agents/prompts/sentinel_system_prompt.txt` for the system prompt under development.
