# Lab 5 — Full Pipeline
<!--
Replace every item in square brackets before submitting.
Keep this README focused on what the design does, how it is used, and how it was
verified.
-->
## Design Scope and Assumptions
- **In scope:** This lab implements the full MIPS pipeline in Verilog
- **Out of scope:** Optimization
- **Assumptions:** All previous pipeline states are implemented
- **Limitations:** Limited to 32 bit bus and 256 addresses in data memory.
## Requirements
| Requirement | Description | Verification Method |
|---|---|---|
| Instruction Fetch 1 | A full Mips pipeline instruction fetch stage | Test case, waveform, inspection |
| Decode 2 | A full Mips pipeline decode stage | Test case, waveform, inspection |
| Execute 3 | A full Mips pipeline execute stage | Test case, waveform, inspection |
| MemoryWB4 | A full Mips pipeline memory and writeback stage | Test case, waveform, inspection |
| mips_pipeline | A full Mips pipeline, bringing all four pipeline modules/stages together into one clean module | Test case, waveform, inspection |

## Implementation
### Source Code
| File | Description |
|---|---|
| [`fetch.v`](LINK_TO_IMPLEMENTATION_CODE) | Source code for fetch module |
| [`Decode.v`](LINK_TO_COMPONENT_CODE) | Source code for decode module |
| [`EXECUTE.v`](LINK_TO_TESTBENCH_CODE) | Source code for execute module |
| [`MEMORY.v`](LINK_TO_TESTBENCH_CODE) | Source code for memory module |
| [`WB.v`](LINK_TO_TESTBENCH_CODE) | Source code for writeback module |
| [`mips_pipeline.v`](LINK_TO_TESTBENCH_CODE) | Source code for mips pipeline module |
| [`WB_tb.v`](LINK_TO_TESTBENCH_CODE) | Source code for writeback testbench |
| [`mips_pipeline_tb.v`](LINK_TO_TESTBENCH_CODE) | Source code for mips pipeline testbench |

### Implementation Notes
- 32 bit data bus, 256 memory and instruction addresses
- All modules are reusable within MIPS pipeline context
- PC increments by 1 instead of 4
## Verification
### Verification Strategy
The design is verified using **[simulation, formal checks, hardware testing, or
another method]**.
Verification covers:
- [Normal operating case]
- [Boundary or maximum-value case]
- [Reset or initialization case]
- [Invalid, stalled, or exceptional case, if applicable]
### Testbench and Waveform
Save screenshots and waveform images in the repository's `images/` folder.
![Testbench or waveform](images/[testbench-screenshot-filename].png)
The testbench source is available [*here*](LINK_TO_TESTBENCH_CODE).
### Results
| Test Case | Expected Result | Observed Result | Status |
|---|---|---|---|
| TC-01 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-02 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-03 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
## Reproduction Instructions
### Tools and Versions
- **Simulator / synthesis tool:** Vivado 2025.1
- **Language / standard:** Verilog-2005
- **Operating system:** Windows
- **Additional dependencies:** Testbench & README templates from Professor Quon
### Build and Run
```bash
# Replace these commands with the commands required for this lab.
[compile-command]
[run-command]
```
Expected output:
```text
[Paste a short representative output or result here.]
```
## Repository Organization
```text
.
├── README.md
├── images/
│ ├── [timing-diagram-filename].png
│ └── [testbench-screenshot-filename].png
├── [source-files]
└── [testbench-files]
```
## Known Issues and Future Improvements
- [Document any known issue, unverified behavior, or technical debt.]
- [Describe a realistic improvement or extension.]
