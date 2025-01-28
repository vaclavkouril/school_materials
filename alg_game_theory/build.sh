#!/bin/bash

# Build the complete document or a specific subset
PARAM="$1"
BUILD_DIR="build"
MAIN_FILE="main.tex"

# Ensure build directory exists
mkdir -p "$BUILD_DIR"

# Function to build all
build_all() {
  echo "Building complete study guide..."
  pdflatex -output-directory="$BUILD_DIR" "$MAIN_FILE" || exit 1
  bibtex "$BUILD_DIR/main.aux" || true
  pdflatex -output-directory="$BUILD_DIR" "$MAIN_FILE" || exit 1
  pdflatex -output-directory="$BUILD_DIR" "$MAIN_FILE" || exit 1
}

# Function to build definitions only
build_definitions() {
  echo "Building definitions-only document..."
  cat << 'END' > temp.tex
\documentclass[a4paper,12pt]{article}
\usepackage{amsmath,amssymb,amsthm,hyperref}

% Definitions for theorem-like environments
\newtheorem{definition}{Definition}[section]
\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}{Proposition}[section]

\begin{document}
END

  grep -E '\\begin\{definition\}|\\begin\{theorem\}|\\begin\{proposition\}' "$MAIN_FILE" >> temp.tex
  echo "\end{document}" >> temp.tex

  pdflatex -output-directory="$BUILD_DIR" temp.tex || exit 1
  rm temp.tex
}

if [ "$PARAM" == "definitions" ]; then
  build_definitions
else
  build_all
fi
