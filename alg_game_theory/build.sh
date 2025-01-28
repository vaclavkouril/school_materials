#!/bin/bash

# Build the complete document or a specific subset
PARAM="$1"
BUILD_DIR="build"
MAIN_FILE="main.tex"

mkdir -p "$BUILD_DIR"

build_all() {
  echo "Building complete study guide..."
  pdflatex -output-directory="$BUILD_DIR" "$MAIN_FILE" || exit 1
  bibtex "$BUILD_DIR/main.aux" || true
  pdflatex -output-directory="$BUILD_DIR" "$MAIN_FILE" || exit 1
}

build_overview() {
  echo "Building overview document..."
  cat << 'END' > temp_overview.tex
\documentclass{article}
\usepackage{amsmath,amssymb,amsthm,hyperref}
\usepackage[a4paper, total={7in, 10in}]{geometry}
\usepackage{graphicx}
\usepackage{tocloft}
\usepackage{algorithm}
\usepackage{algorithmicx}
\usepackage{algpseudocode}
\usepackage[czech]{babel}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}% Import macros
\input{macros.tex}

% Definitions for theorem-like environments
\newtheorem{definition}{Definition}[section]
\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}{Proposition}[section]

\begin{document}

\tableofcontents
\section*{Overview}
END

  # Process each chapter directory separately
  for dir in $(ls -d study_guide/*/ | sort -n); do
    chapter_num=$(basename "$dir")
    echo "\section{Chapter $chapter_num}" >> temp_overview.tex
    
    for file in $(ls "$dir" | sort -n); do
      section_name=$(basename "$file" .tex | sed 's/_/ /g')
      echo "\subsection{$section_name}" >> temp_overview.tex
      awk '
        /\\begin\{definition\}/, /\\end\{definition\}/ { print; next }
        /\\begin\{theorem\}/, /\\end\{theorem\}/ { print; next }
        /\\begin\{proposition\}/, /\\end\{proposition\}/ { print; next }
        /\\begin\{proof\}/, /\\end\{proof\}/ { print; next }
        /\\begin\{algorithm\}/, /\\end\{algorithm\}/ { print; next }
      ' "$dir/$file" >> temp_overview.tex
    done
  done

  echo "\end{document}" >> temp_overview.tex

  pdflatex -output-directory="$BUILD_DIR" temp_overview.tex || exit 1
  rm temp_overview.tex
}

cleanup() {
  echo "Cleaning up build directory..."
  rm -rf "$BUILD_DIR"/*
}

if [ "$PARAM" == "overview" ]; then
  build_overview
elif [ "$PARAM" == "clean" ]; then
  cleanup
else
  build_all
fi
