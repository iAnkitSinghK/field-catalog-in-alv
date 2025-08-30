# Field Catalog in ALV (SAP ABAP)

This repository is a curated collection of notes and sample implementations for **creating and using Field Catalogs** in different types of ABAP ALV reports – Classical ALV, OO ALV, and ALV with Integrated Data Access (IDA).

The goal of this repo is to serve as a **reference and learning material** for ABAP developers who want to understand how to build and bind field catalogs to ALV.

---

## 📌 Contents

### Classical ALV

**Field catalog creation approaches:**
- Using Function Module:  
  - `REUSE_ALV_FIELDCATALOG_MERGE`
- Manual Field Catalog Creation:  
  - Building an internal table for the field catalog

**For Hierarchical Sequential List:**
- Special field catalog creation for `REUSE_ALV_HIERSEQ_LIST_DISPLAY`

**Binding field catalog to ALV:**
- `REUSE_ALV_LIST_DISPLAY`
- `REUSE_ALV_GRID_DISPLAY`
- `REUSE_ALV_HIERSEQ_LIST_DISPLAY`

### OO ALV

*(Coming soon – will include `CL_GUI_ALV_GRID` and related examples)*

### ALV IDA

*(Coming soon – focus on CDS + ALV IDA integration)*

---

## 🛠️ Tech Stack

- **ABAP** (SAP GUI / Eclipse with ADT)
- **ALV** (ABAP List Viewer)
  - Classical ALV
  - OO ALV
  - ALV IDA

---

## 🚀 How to Use

1. **Clone the repository:**
   ```sh
   git clone https://github.com/iAnkitSinghK/field-catalog-in-alv.git
   ```

2. **Open the code** in SAP GUI or Eclipse ADT.

3. **Run the programs** to explore different ways of:
   - Creating field catalogs
   - Binding data to ALV displays

---

## 📖 Learning Purpose

This repo is primarily created for:
- ABAP learners exploring ALV functionality
- Interview preparation (Classical ALV field catalog concepts)
- Reference material for real project implementations

---

## 🔮 Future Enhancements

- Add examples for OO ALV (`CL_GUI_ALV_GRID`)
- Add examples for ALV with IDA (CDS-based)
- More documentation & visual examples

---

## 👨‍💻 Author

**Ankit Singh**  
SAP Certified ABAP Cloud Back-End Developer  
[GitHub Profile](https://github.com/iAnkitSinghK)

---
