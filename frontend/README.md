# Praheri.AI — Frontend

The frontend is a React + TypeScript application providing two primary surfaces: an investor-facing dashboard and a compliance-officer escalation console, matching the two main user roles described in the proposal.

## Current Status

This is a **Phase 1 prototype**. The project is scaffolded with Vite + React + TypeScript and is configured to talk to the backend API described in `backend/README.md`. Since the backend's agent pipeline endpoints are not yet implemented (they return `501 Not Implemented` by design), the frontend currently renders against mocked/local fixture data where needed, clearly marked as such in code comments — it does not fabricate a working connection to endpoints that don't exist yet.

## Tech Stack

- **Framework:** React 18 + TypeScript
- **Build tool:** Vite
- **Styling:** to be finalized in Phase 2 (Tailwind CSS is the current candidate, not yet committed to)
- **API layer:** typed client in `src/services/api.ts`, single source of truth for backend calls

## Directory Structure

```
frontend/
├── src/
│   ├── components/
│   │   ├── dashboard/      # Investor-facing widgets
│   │   ├── alerts/          # Agent nudge + Counterfactual Receipt display
│   │   ├── compliance/      # Compliance officer queue components
│   │   └── common/           # Shared UI primitives
│   ├── pages/
│   │   ├── InvestorDashboard.tsx
│   │   ├── ComplianceQueue.tsx
│   │   ├── AuditTrail.tsx
│   │   └── ConsentSettings.tsx
│   ├── services/
│   │   └── api.ts
│   ├── types/
│   ├── App.tsx
│   └── main.tsx
├── package.json
└── tsconfig.json
```

## Running Locally

```bash
npm install
npm run dev
```

The app will be available at `http://localhost:5173`. By default it expects the backend at `http://localhost:8000` — configure this in a local `.env` file if your setup differs.

## What's Implemented vs. Planned

| Component | Status |
|---|---|
| Project scaffold (Vite + React + TypeScript) | Implemented |
| Routing and page shells | Implemented |
| Typed API client | Implemented (against the currently real `/health` endpoint; agent endpoints await backend Milestones M2-M4) |
| Investor Dashboard (live data) | Planned — blocked on backend alert endpoints |
| Compliance Queue (live data) | Planned — blocked on Guardian Agent (Milestone M4) |
| Consent Settings UI | Planned (Milestone M5) |
| Audit Trail viewer | Planned (Milestone M7) |

This table reflects actual build state, not aspirational scope, and is updated alongside backend milestone progress.
