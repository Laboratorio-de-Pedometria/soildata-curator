#!/usr/bin/env Rscript
# 02-install-r-packages.R
# Installs the R packages required to interact with the local inference snap.
#
# The deepseek-r1 snap ships its own silicon-optimized runtime and exposes a
# local OpenAI-compatible REST API. The API endpoint is discovered at runtime
# via `deepseek-r1 status --format=json`, and requests are sent directly to
# it — no cloud connection or separate Ollama installation is required.
#
# The packages used are:
#
#   processx  – spawn and control external processes from R, used here to call
#               `deepseek-r1 status --format=json` and capture the API URL.
#
#   httr2     – modern HTTP client for R, used to call the snap's local
#               OpenAI-compatible REST API.
#
#   jsonlite  – JSON parser, used to decode the status output and the API
#               response from the local inference server.
#
# All packages are available on CRAN.
#
# Requirements:
#   - R (>= 4.0.0)
#   - Internet access to reach a CRAN mirror (only needed during installation)
#   - The deepseek-r1 inference snap installed locally (see src/01-install-snap.sh)
#
# Usage:
#   Rscript src/02-install-r-packages.R

# Packages required to interact with the deepseek-r1 inference snap
pkgs <- c(
  "processx",  # Spawn and control snap processes, capture their output
  "httr2",     # HTTP client for calling the snap's local REST API
  "jsonlite"   # JSON parsing for snap status output and API responses
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
