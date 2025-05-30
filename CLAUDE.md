# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an enterprise architecture documentation project for an ERP system design targeting small and medium enterprises (SME) in the baking ingredients and tools business. The project follows TOGAF ADM methodology and uses Vietnamese language for documentation.

## Architecture Structure

The project is organized into 5 main sections following TOGAF phases:

1. **Giới thiệu** (Introduction) - Project rationale, scope, and overview
2. **Phương pháp** (Methodology) - TOGAF ADM approach for business, application, and technology architecture
3. **Kiến trúc cơ sở** (Baseline Architecture) - Current state analysis across all architecture layers
4. **Kiến trúc mục tiêu** (Target Architecture) - Future state design
5. **Kết luận** (Conclusion) - Summary and recommendations

## Key Components

### Business Architecture (Kiến trúc nghiệp vụ)

- **Location**: `3.2 Kiến trúc nghiệp vụ/` directory
- **Business Services**: 17 services coded BS001-BS017 across 7 service groups
- **Business Processes**: 8 main processes coded BP001-BP008
- **Organizational Structure**: 8 departments with 3 management levels

### Documentation Standards

- Business services use BS### codes (BS001, BS002, etc.)
- Business processes use BP### codes (BP001, BP002, etc.)
- BPMN diagrams stored in `bpmn/` subdirectories with matching .bpmn and .svg files
- ArchiMate models stored in `archimate/` with .archi files
- Mermaid diagrams embedded directly in markdown files

### File Naming Conventions

- Vietnamese folder names with numbered prefixes (e.g., "1. Giới thiệu")
- Descriptive Vietnamese filenames with spaces (e.g., "1.1. Lí do chọn đề tài.md")
- Business process files follow BP###.bpmn pattern
- README.md files provide navigation and overview for complex sections

## Development Notes

When working with BPMN files, when .bpmn XML is generated, instruct the user to generate .svg file.

ArchiMate models in the `archimate/` directory contain enterprise architecture viewpoints and should be opened with compatible ArchiMate tools for editing.
