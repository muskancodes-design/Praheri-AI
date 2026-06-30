# Praheri.AI — Backend

This is the backend service for Praheri.AI, implementing the Sentinel → Skeptic → Guardian agent pipeline, the REST API, and the data layer described in the main project proposal.

## Current Status

This backend is at **Phase 1 prototype stage**. The components below are implemented or scaffolded against synthetic data; none of them connect to a live broker, AMC, or Account Aggregator system yet. That integration is scoped for Phase 2 (see `architecture/README.md` and the roadmap in the root README).

`main.py` in this directory currently exposes a minimal, working FastAPI application with a health-check endpoint and the route structure the agent pipeline will be wired into. It is intentionally honest about what is implemented versus planned — see inline comments for what is real and what is a defined-but-unimplemented stub.

## Tech Stack

- **Framework:** FastAPI (Python 3.11+)
- **Database:** PostgreSQL (via SQLAlchemy + Alembic for migrations)
- **AI Agents:** Claude API, called from `app/agents/` (Sentinel and Skeptic agents)
- **Policy Engine:** Deterministic, rule-based — no LLM in the authorization path (Guardian Agent)
- **Validation:** Pydantic schemas for all request/response models

## Directory Structure

```
backend/
├── app/
│   ├── agents/         # Sentinel, Skeptic, Guardian agent logic
│   ├── api/             # Route handlers
│   ├── core/             # Config, security, logging
│   ├── models/           # SQLAlchemy ORM models
│   ├── schemas/          # Pydantic request/response schemas
│   ├── services/         # Business logic (behavioral modeling, policy evaluation, etc.)
│   ├── db/                # DB session + Alembic migrations
│   └── main.py            # FastAPI application entrypoint
├── tests/
├── requirements.txt
└── Dockerfile
```

## Running Locally

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

The API will be available at `http://localhost:8000`, with interactive docs at `http://localhost:8000/docs`.

## What's Implemented vs. Planned

| Component | Status |
|---|---|
| FastAPI app skeleton + health check | Implemented |
| Database models and migrations | Planned (Milestone M1) |
| Sentinel Agent (Claude API integration) | Planned (Milestone M2) |
| Skeptic Agent | Planned (Milestone M3) |
| Guardian Agent (deterministic policy engine) | Planned (Milestone M4) |
| Synthetic data ingestion | Planned (Milestone M1) |
| Audit logging | Planned (Milestone M7) |

This table is kept up to date as a true reflection of build progress — see the Issues tab for the corresponding open tasks.
