# soildata-curator

An AI-powered soil data curator for the [Brazilian Soil Data Repository (SoilData)](https://soildata.mapbiomas.org/).

## Overview

This project explores the use of **silicon-optimized inference snaps from Ubuntu** to curate soil data for the Brazilian Soil Data Repository. The goal is to find an AI solution capable of producing high-quality metadata to describe and catalog soil datasets in SoilData with **minimum human intervention**.

Two key capabilities are being evaluated:

1. **Metadata validation** – automated checks to verify that existing metadata conforms to predefined standards.
2. **Metadata inference and enrichment** – LLM-assisted inference of missing metadata fields, and enrichment of existing fields, based on the content of the associated data tables.

## Why silicon-optimized inference snaps?

[Ubuntu snaps](https://snapcraft.io/) provide a convenient, sandboxed packaging format that runs consistently across Linux environments. Silicon-optimized builds take advantage of modern hardware acceleration (e.g., ARM/Apple Silicon or dedicated AI accelerators) to run large language models (LLMs) efficiently on-device, without relying on cloud APIs. This makes the curation pipeline faster, more private, and reproducible.

## Models

We are starting with **[DeepSeek R1](https://www.deepseek.com/)**, a high-performance open-weight reasoning model well-suited for structured data understanding and text generation tasks. It is available as the [`deepseek-r1`](https://snapcraft.io/deepseek-r1) Canonical inference snap, which bundles the silicon-optimized runtime and model weights together.

Other models may be evaluated over time as the project matures.

## Workflow

```
Soil dataset (raw)
       │
       ▼
Data standardization in R
       │
       ▼
Validation checks on existing metadata ──► Flag / reject non-conforming entries
       │
       ▼
LLM inference of missing metadata fields
(based on data tables)
       │
       ▼
Enrichment of existing metadata fields
(LLM-assisted, based on data tables)
       │
       ▼
Curated dataset ready for SoilData ingestion
```

## Getting Started

> **Note:** Detailed setup instructions will be added as the project evolves.

### Prerequisites

- Ubuntu (latest LTS recommended)
- [Snapd](https://snapcraft.io/docs/installing-snapd) installed and running
- The `deepseek-r1` [inference snap](https://documentation.ubuntu.com/inference-snaps/) from Canonical

### Installation

```bash
# Install the deepseek-r1 silicon-optimized inference snap
bash src/install-snap.sh
```

### Running the curator

Instructions and scripts will be provided in this repository as development progresses.

## Repository Structure

```
soildata-curator/
├── src/
│   └── install-snap.sh   # Installs the silicon-optimized inference snap
├── README.md             # This file
└── LICENSE               # MIT License
```

## Contributing

Contributions are welcome! Whether you want to:

- Test new inference snaps or models
- Improve metadata validation rules
- Add support for additional dataset formats
- Improve documentation

Please open an issue or submit a pull request. All contributors are expected to follow the project's [Code of Conduct](https://www.contributor-covenant.org/).

## License

This project is licensed under the [MIT License](LICENSE) – © 2026 Laboratório de Pedometria | UTFPR.
