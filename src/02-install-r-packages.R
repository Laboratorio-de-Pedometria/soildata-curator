#!/usr/bin/env Rscript
# 02-install-r-packages.R
# Installs the R packages required to connect with the inference snap.
#
# The deepseek-r1 snap exposes an OpenAI-compatible REST API.  Two packages
# are sufficient to interact with it from R:
#
#   httr      – send HTTP requests (GET/POST) to the API endpoint
#   jsonlite  – encode request bodies and decode JSON responses
#
# Neither package belongs to the tidyverse.  Both are available on CRAN and
# have minimal dependency trees, keeping the installation lightweight.
#
# Requirements:
#   - R (>= 4.0.0)
#   - Internet access to reach a CRAN mirror (only needed during installation)
#
# Usage:
#   Rscript src/02-install-r-packages.R

# Packages strictly required to communicate with the inference snap REST API
pkgs <- c(
  "httr",     # HTTP/1.1 client — POST to /v1/chat/completions, etc.
  "jsonlite"  # Fast, standards-compliant JSON encoder/decoder
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
