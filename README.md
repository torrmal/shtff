
# WHAT THE FAQ - For pre-seed founders

A LaTeX book project with a complete setup for document compilation and management.

## Files

- `main.tex` - Main LaTeX document
- `chapters/` - Directory containing individual chapter files
  - `introduction.tex` - Introduction chapter
- `Makefile` - Build automation
- `.gitignore` - Git ignore file for LaTeX auxiliary files
- `README.md` - This file

## Prerequisites

Make sure you have a LaTeX distribution installed:

- **macOS**: Install BasicTeX using Homebrew: `brew install --cask basictex`
- **Linux**: Install TeX Live: `sudo apt-get install texlive-full` (Ubuntu/Debian)
- **Windows**: Install MiKTeX or TeX Live

## Environment Setup

### macOS (BasicTeX)

After installing BasicTeX, you need to add the LaTeX executables to your PATH:

```bash
# Add to your shell profile (~/.zshrc, ~/.bash_profile, or ~/.bashrc)
export PATH="/usr/local/texlive/2025basic/bin/universal-darwin:$PATH"

# Reload your shell configuration
source ~/.zshrc  # or ~/.bash_profile
```

**Alternative method (recommended):**
```bash
# Run this command after BasicTeX installation
eval "$(/usr/libexec/path_helper)"
```

### Linux

```bash
# Add to your shell profile (~/.bashrc or ~/.zshrc)
export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"

# Reload your shell configuration
source ~/.bashrc
```

### Windows

Add the TeX Live bin directory to your system PATH:
- TeX Live: `C:\texlive\2025\bin\windows`
- MiKTeX: `C:\Program Files\MiKTeX\miktex\bin\x64`

## Verify Installation

Check that LaTeX executables are available:

```bash
# Check if pdflatex is accessible
which pdflatex

# Check version
pdflatex --version

# Check if other tools are available
which bibtex
which make
```

## Building the Book

### Quick Start

1. **Set up environment** (if not already done):
   ```bash
   # macOS - run this once after BasicTeX installation
   eval "$(/usr/libexec/path_helper)"
   ```

2. **Clone or download** this project to your local machine

3. **Navigate to the project directory**:
   ```bash
   cd /path/to/your/book
   ```

4. **Compile the document**:
   ```bash
   make
   ```

5. **View the PDF**:
   ```bash
   make view
   ```

### Available Commands

- `make` or `make all` - Compile the document (full compilation with bibliography)
- `make quick` - Quick compile (single pass, no bibliography) 
- `make view` - Open the PDF in your default viewer
- `make clean` - Remove all generated files (including the `out/` directory)
- `make distclean` - Same as clean (removes all generated files)
- `make help` - Show available commands

**Note:** All generated files (PDF, log files, auxiliary files) are stored in the `out/` directory to keep your project directory clean.

### Manual Compilation

If you prefer to compile manually or troubleshoot issues:

```bash
# Navigate to the output directory
cd out

# Run pdflatex (first pass)
pdflatex ../main.tex

# Run bibtex (if you have bibliography)
bibtex main

# Run pdflatex again (second pass)
pdflatex ../main.tex

# Run pdflatex final time (third pass for cross-references)
pdflatex ../main.tex
```

### Troubleshooting Build Issues

**If you get "command not found" errors:**

1. **Check PATH setup**:
   ```bash
   echo $PATH | grep texlive
   ```

2. **Verify LaTeX installation**:
   ```bash
   which pdflatex
   ls -la /usr/local/texlive/2025basic/bin/universal-darwin/
   ```

3. **Re-run path helper** (macOS):
   ```bash
   eval "$(/usr/libexec/path_helper)"
   ```

**If compilation fails:**

1. **Check the log file**:
   ```bash
   cat out/main.log | tail -20
   ```

2. **Clean and rebuild**:
   ```bash
   make clean
   make
   ```

3. **Install missing packages** (if needed):
   ```bash
   sudo tlmgr install <package-name>
   ```

## Document Structure

This book uses a modular structure for better organization:

### Main Files
- `main.tex` - Main document file with:
  - Document class and package imports
  - Page layout and styling
  - Title page setup
  - Table of contents
  - Chapter inclusions

### Chapter Files
- `chapters/introduction.tex` - Introduction chapter
- Additional chapter files can be added to the `chapters/` directory

### Build Output
- `out/` - Directory containing all generated files:
  - `main.pdf` - Final compiled book
  - `main.log` - Compilation log
  - `main.aux`, `main.toc`, etc. - LaTeX auxiliary files

## Customization

1. **Change the document class**: Modify the `\documentclass` line in `main.tex`
2. **Add packages**: Include additional packages in the preamble
3. **Modify styling**: Adjust the page geometry, fonts, and colors
4. **Add bibliography**: Create a `references.bib` file for citations

## Tips

- Use `make quick` for faster compilation during development
- Use `make clean` to remove auxiliary files before committing to version control
- The `.gitignore` file is configured to ignore LaTeX auxiliary files and the `out/` directory
- **Adding new chapters**: Create new `.tex` files in the `chapters/` directory and include them in `main.tex` using `\input{../chapters/filename}`
- **Font**: This book uses Source Serif Pro for professional typography
- **Styling**: The document uses a clean black and white design perfect for printing

## Troubleshooting

- If compilation fails, check the `.log` file for error messages
- Make sure all required packages are installed
- For bibliography issues, ensure `references.bib` exists and contains valid entries
