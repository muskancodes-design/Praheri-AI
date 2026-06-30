# Skeptic Agent

## Role

The Skeptic Agent is the system's internal adversary. Its sole job is to independently review every proposal the Sentinel Agent generates and try to find reasons it should not proceed — before it ever reaches the investor. This is the architectural answer to the most common weakness in single-model agentic systems: nothing checks the first model's confidence.

## Inputs

- The Sentinel Agent's full proposal (trigger, reasoning, recommended action, urgency, confidence)
- The same underlying investor data the Sentinel had access to, so the Skeptic can independently verify or dispute the Sentinel's interpretation rather than only critiquing its wording

## Output

```json
{
  "verdict": "approve | reject | downgrade",
  "objection_reasoning": "string — specific concerns raised, or confirmation of why none were found",
  "alternative_explanation_considered": "string or null"
}
```

## Example Review (Illustrative, Not a Guaranteed Output)

> Reviewing Sentinel proposal: SIP pause recommendation based on two consecutive failures.
> Alternative explanation considered: Could this be a deliberate switch to a different fund rather than financial distress? Checked: no new SIP mandate was initiated in the same period, which weakens that alternative.
> Objection reasoning: The Sentinel's confidence (0.78) is reasonably supported by the absence of a market-wide disruption and the lack of a competing explanation. However, the salary-credit delay signal is based on a single month of data, which is a thin basis on its own — recommend the action proceed, but at "confirm_required" rather than "auto_execute" tier, given the moderate uncertainty.
> Verdict: approve (with a downgrade recommendation on autonomy tier, passed to the Guardian Agent for final determination)

## What the Skeptic Agent Is Not Permitted to Do

- It cannot authorize execution — that decision belongs solely to the Guardian Agent.
- It cannot directly communicate with the investor; its output is purely an internal input to the next pipeline stage.
- It is deliberately not the same prompt or persona as the Sentinel Agent — it is configured to default toward skepticism and is required to actively search for a plausible alternative explanation before approving, rather than simply rubber-stamping a well-written Sentinel proposal.

## Prompting Approach

The Skeptic Agent is a second, independent Claude API call, explicitly instructed to argue against the Sentinel's proposal first, then decide whether its own objections hold up. This ordering — generate the counter-case before reaching a verdict — is a deliberate design choice to reduce the risk of the Skeptic simply agreeing with a confidently-worded Sentinel output.

## Implementation Status

Not yet implemented. Tracked as Milestone M3, dependent on Milestone M2 (Sentinel Agent) being complete. See `backend/app/agents/skeptic_agent.py` and `backend/app/agents/prompts/skeptic_system_prompt.txt`.
