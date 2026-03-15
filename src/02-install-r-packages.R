#!/usr/bin/env Rscript
# 02-install-r-packages.R
# Installs the R packages required to interact with the local inference snap.
#
# The deepseek-r1 snap runs a local Ollama-compatible inference server on the
# machine.  The ellmer package provides a high-level R interface for sending
# prompts and receiving responses from local LLM inference engines:
#
#   ellmer  – unified R interface for local and cloud LLMs; chat_ollama() is
#             the entry point for Ollama-compatible local inference servers
#             such as the deepseek-r1 snap.
#
# ellmer is available on CRAN.
#
# Requirements:
#   - R (>= 4.1.0)
#   - Internet access to reach a CRAN mirror (only needed during installation)
#   - The deepseek-r1 inference snap running locally (see src/01-install-snap.sh)
#
# Usage:
#   Rscript src/02-install-r-packages.R

# Package required to interact with the local Ollama-compatible inference snap
pkgs <- c(
  "ellmer"  # High-level R interface for local and cloud LLM inference engines
)

# Install only packages that are not yet available in the current R library
to_install <- pkgs[!vapply(pkgs, requireNamespace, logical(1L), quietly = TRUE)]

if (length(to_install) == 0L) {
  message("All required packages are already installed.")
} else {
  message("Installing missing packages: ", paste(to_install, collapse = ", "))
  install.packages(to_install, repos = "https://cloud.r-project.org")
  message("Installation complete.")
}
