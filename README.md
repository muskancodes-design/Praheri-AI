# Praheri-AI
Autonomous Multi-Agent Investor Protection System for SEBI Hackathon
<div align="center">

# Praheri.AI
### The Autonomous Investor Protection Agent

**"We don't wait for you to ask. We watch, we reason, we act."**

Built for the SBI Hackathon — Theme: Agentic AI & Emerging Tech

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Backend CI](https://img.shields.io/badge/backend--ci-passing-brightgreen)](.github/workflows/backend-ci.yml)
[![Frontend CI](https://img.shields.io/badge/frontend--ci-passing-brightgreen)](.github/workflows/frontend-ci.yml)
[![Python](https://img.shields.io/badge/python-3.11+-blue.svg)](backend/pyproject.toml)
[![TypeScript](https://img.shields.io/badge/typescript-5.x-blue.svg)](frontend/tsconfig.json)
[![Status](https://img.shields.io/badge/status-Phase%201%20Prototype-orange)](#roadmap)

</div>

---

## Why Praheri.AI Exists

Retail investors don't lose money because they lack information — they lose it in the silence between app sessions, when a SIP fails quietly, a portfolio drifts past its risk tolerance, or an impulsive trade gets triggered by a social media tip. Every existing fintech tool — dashboards, robo-advisors, chatbots — waits for the investor to log in and ask. Praheri.AI doesn't wait.

Praheri.AI is an autonomous, multi-agent system that continuously observes investor behaviour, reasons about what it means, and acts to prevent harm — within a consent-bound, fully auditable framework. It is built to be a credible answer to a hard question regulators will always ask of agentic AI: *how do you stop the agent from being confidently wrong?*

## How It Works, In One Paragraph

Three agents share responsibility instead of one model doing everything. The **Sentinel Agent** watches investor data and proposes an action when it detects meaningful risk. The **Skeptic Agent** independently challenges that proposal, looking for false positives before anything reaches the investor. The **Guardian Agent** — a deterministic, non-generative policy engine — checks the surviving proposal against compliance rules and the investor's own consent settings, and is the only component permitted to authorise an action. Every decision, including ones that were challenged and rejected, is logged in a full, regulator-readable audit trail.

## Features

- **Continuous behavioural monitoring** of SIP health, transaction patterns, portfolio composition, and compliance status
- **Three-agent decision pipeline** (propose → challenge → authorise) instead of a single unchecked model
- **Behavioral Immunity Score** — flags trades correlated with social/herd-driven spikes in a stock's retail interest
- **Counterfactual Receipts** — every action explains what would likely have happened without intervention
- **Volatility Cooling-Off Mode** — the system throttles its own notifications during high-volatility periods
- **Respectful Silence Protocol** — repeatedly dismissed nudges are downgraded, never escalated in frequency
- **Family Guardian Mesh** — consent-based account oversight for elderly or less digitally literate family members
- **Full audit and explainability layer** — every action, and every action considered and rejected, is logged

## Architecture Overview

Full architecture detail: [`docs/architecture.md`](docs/architecture.md)
Agent reasoning workflow: [`docs/agent-workflow.md`](docs/agent-workflow.md)

## Technology Stack

| Layer | Technology |
|---|---|
| AI Reasoning Agents | Claude API (Sentinel, Skeptic — independently prompted) |
| Policy/Authorisation | Deterministic rule engine (Python, JSON-configured policies) |
| Backend | FastAPI (Python 3.11+) |
| Database | PostgreSQL |
| Behavioural Modeling | pandas, scikit-learn |
| Frontend | React + TypeScript, Vite |
| Containerisation | Docker, Docker Compose |
| CI/CD | GitHub Actions |

## Getting Started

See [Installation Guide](#installation-guide) below.

## Project Status

This repository reflects a **Phase 1 hackathon prototype** built on synthetic data. It is structured for direct extension into Phase 2 (real Account Aggregator integration, broker sandbox testing) and eventual production deployment. See [Roadmap](#roadmap).

## Contributing

We welcome contributions — see [CONTRIBUTING.md](CONTRIBUTING.md).

## Security

Please see [SECURITY.md](SECURITY.md) for responsible disclosure guidelines.

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE).
