# soildata-curator

An AI-powered soil data curator for the [Brazilian Soil Data Repository (SoilData)](https://soildata.mapbiomas.org/).

## Overview

This project explores the use of **silicon-optimized inference snaps from Ubuntu** to curate soil data for the Brazilian Soil Data Repository. The goal is to find an AI solution capable of producing high-quality metadata to describe and catalog soil datasets in SoilData with **minimum human intervention**.

Two key capabilities are being evaluated:

1. **Metadata validation** – automated checks to verify that dataset metadata is complete and conforms to the required standards.
2. **Missing metadata inference** – AI-assisted inference of metadata fields that are absent or incomplete, using contextual information from the dataset itself.

## Why silicon-optimized inference snaps?

[Ubuntu snaps](https://snapcraft.io/) provide a convenient, sandboxed packaging format that runs consistently across Linux environments. Silicon-optimized builds take advantage of modern hardware acceleration (e.g., ARM/Apple Silicon or dedicated AI accelerators) to run large language models (LLMs) efficiently on-device, without relying on cloud APIs. This makes the curation pipeline faster, more private, and reproducible.

## Models

We are starting with **[DeepSeek](https://www.deepseek.com/)**, a high-performance open-weight language model well-suited for structured data understanding and text generation tasks.

Other models may be evaluated over time as the project matures.

## Workflow

```
Soil dataset (raw)
       │
       ▼
Metadata extraction
       │
       ▼
Validation checks ──► Flag / reject non-conforming entries
       │
       ▼
Missing metadata inference (LLM)
       │
       ▼
Curated dataset ready for SoilData ingestion
```

## Getting Started

> **Note:** Detailed setup instructions will be added as the project evolves.

### Prerequisites

- Ubuntu (latest LTS recommended)
- [Snapd](https://snapcraft.io/docs/installing-snapd) installed and running
- An inference snap for your target model (e.g., DeepSeek)

### Installation

```bash
# Install the inference snap (example)
sudo snap install <inference-snap-name>
```

### Running the curator

Instructions and scripts will be provided in this repository as development progresses.

## Repository Structure

```
soildata-curator/
├── README.md       # This file
└── LICENSE         # MIT License
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
