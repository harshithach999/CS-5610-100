
# CS-5610-100
**Project Name:** EDA on Breast Cancer

 Developed machine learning models using R to analyze health data. Utilized exploratory data analysis (EDA), data mining techniques, and data visualization tools to extract meaningful insights from large medical datasets. Achieved high accuracy and improved early detection.

**Data Source:** Cancer Imaging Archive (TCIA) (https://wiki.cancerimagingarchive.net/pages/viewpage.action?pageId=22516629)  
The datasets used for Breast cancer are included in this path: `harshithach999/CS-5610-100`.

### Data Description:

Breast cancer is the most common cancer in women. The National Cancer Institute (NCI) has one of the most extensive cancer imaging programs, which includes a wealth of supporting data such as patient outcomes, treatment details, and image analyses.

The dataset **CBIS DDSM (Curated Breast Imaging Subset of DDSM)** is a refined and uniform collection of breast images extracted from the Digital Database for Screening Mammography (DDSM). This database contains normal, benign, and malignant cases with verified pathology information and comprises a total of 2,620 mammography studies.

Based on the **BIRADS (Breast Imaging Reporting and Data System)** category, the dataset was split into training and testing sets, with 20% of the cases allocated for testing and the remaining for training. This division was conducted separately for all mass cases and all calcification cases.

The dataset includes four CSV files with 12 feature variables:
- **Patient ID:** Unique identifier for each patient.
- **Breast Density:** Positive integer variable with four density levels.
- **Left or Right Breast:** Categorical variable indicating which breast the data pertains to.
- **Abnormality ID:** Unique positive integer for each abnormality.
- **Abnormality Type:** Categorical variable describing the characteristics of the mammogram.
- **Calc Type:** Categorical variable based on the abnormality type.
- **Calc Distribution:** Categorical variable classified by the location of the breast.
- **Mass Shape:** Categorical variable based on its abnormality type.
- **Mass Margin:** Categorical variable indicating the edge characteristics of a mass or lesion.
- **Assessment:** Positive integer variable with five assessment levels.
- **Pathology:** Categorical variable representing the type of cancer.
- **Subtlety:** Positive integer variable rated from 1 to 5, indicating the difficulty of detection.

For further reading, you can refer to:
- [NCBI Article 1](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7569667/)
- [NCBI Article 2](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7349542/)


**App Details:**  
The `app.R` file is used to construct the Shiny app. Both the server and UI components are included in this file.

**Outputs:**
- A dropdown box is used to select the pathologic kind of cancer on page 1.
- The data source link and a few images of the output are presented on page 2.

### Visual Outputs:
1. **Output of Malignant Cancer with Respect to Breast Density:**
   ![Malignant Output](https://user-images.githubusercontent.com/77778544/232133870-c6dd09d8-f3f0-4c42-946a-df30a9765e30.png)

2. **Output of Benign without Callback with Respect to Breast Density:**
   ![Benign Output Without Callback](https://user-images.githubusercontent.com/77778544/232135343-779fe4e9-2b6b-4a3f-bccd-60e8152e8415.png)

3. **Output of Benign with Respect to Breast Density:**
   ![Benign Output](https://user-images.githubusercontent.com/77778544/232135153-e2f9ff4d-6568-4d88-ab4e-d20f4a57f1c9.png)

---

