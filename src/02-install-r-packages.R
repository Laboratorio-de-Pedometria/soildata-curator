#!/usr/bin/env Rscript
# 02-install-r-packages.R
# Installs the R packages required to interact with the local inference snap.
#
# The deepseek-r1 snap ships its own silicon-optimized runtime and exposes an
# OpenAI-compatible REST API at http://localhost:8324/v3. The deepseek-r1 chat
# subcommand is interactive and ignores stdin when not connected to a terminal,
# so we call the underlying HTTP API directly from R.
#
# The httr2 package is used to send HTTP requests to the snap REST API:
#
#   httr2  – modern HTTP client for R, used here to send prompts to the
#             deepseek-r1 snap REST API and capture its JSON response.
#
# httr2 is available on CRAN.
#
# Requirements:
#   - R (>= 4.1.0)  # httr2 and the native pipe operator (|>) both require R >= 4.1.0
#   - Internet access to reach a CRAN mirror (only needed during installation)
#   - The deepseek-r1 inference snap installed and its server running
#     (see src/01-install-snap.sh)
#
# Usage:
#   Rscript src/02-install-r-packages.R

# Package required to call the deepseek-r1 snap REST API from R
pkgs <- c(
  "httr2"  # Modern HTTP client for R, used to call the snap REST API
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
