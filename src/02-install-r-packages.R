#!/usr/bin/env Rscript
# 02-install-r-packages.R
# Installs the R packages required to interact with the local inference snap.
#
# The deepseek-r1 snap ships its own silicon-optimized runtime and is invoked
# directly through its command-line interface (e.g. `deepseek-r1 chat`).
# No separate Ollama installation or REST API is required.
#
# The processx package is used to call the snap CLI from R:
#
#   processx  – spawn and control external processes from R, used here to send
#               prompts to the deepseek-r1 snap and capture its output.
#
# processx is available on CRAN.
#
# Requirements:
#   - R (>= 4.0.0)
#   - Internet access to reach a CRAN mirror (only needed during installation)
#   - The deepseek-r1 inference snap installed locally (see src/01-install-snap.sh)
#
# Usage:
#   Rscript src/02-install-r-packages.R

# Package required to call the deepseek-r1 snap CLI directly from R
pkgs <- c(
  "processx"  # Spawn and control the snap process, capture its output
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
