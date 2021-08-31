# Shteyman_Grimaud_Project
This folder contains all the Matlab code necessary to replicate the results of the research project "Odorant Composition and Neuronal Response". This project was submitted to the 2020-2021 New York City Science and Engineering Fair (NYCSEF). The authors are:
   - Gary Shteyman (Staten Island Technical High School, Staten Island, NY, USA)
   - Dr. Julien Grimaud (Institut Supérieur des Biotechnologies de Paris, Villejuif, France).

The purpose of this code is to analyze the correlation between neuronal population response and odor similarity in the olfactory cortex of mice. Each script and function comes with comments that should help you implement your own research, and better understand the script. Here is a quick overview of the different scripts, functions, and variables:
   - fitlm_custom: Performs linear regressions.
   - calculate_mean_response: Calculates the mean neuronal response from extracellular recording data.
   - odor_similarity: Generates the odor feature similarity matrix from a table of odor features.
   - neuron_comparison: Generates the neuron response similarity matrix.
   - odor_neuron_similarity: Compares the odor similarity matrix and the neuron response similarity matrix generated with the code mentioned above.
   - plot_indiv_od_od_regression: Plots exemplar regressions to compare the response of a neuron population to one odor versus the other.
   - calculate_response_variance: Compute neuronal response variance across repeats.
   - odor_feature_table.mat: This variable contains the odor feature table used in our study (see below).
   - generate_all_figures: Calls all the functions and variables mentioned above and generates all figures from the manuscript summarizing our results.

The neuronal recording data used for this project comes from the following article: Grimaud J. et al (2020), "Bilateral Alignment of Receptive Fields in the Olfactory Cortex Points to Non-Random Connectivity. BioRXiv", doi: https://doi.org/10.1101/2020.02.24.960922. The data may be downloaded directly from the article's GitHub repository: https://github.com/VNMurthyLab/IpsiContra (file name : tetrodeRecordings_OC_2s.mat).

The odor feature table, saved in the matlab variable "odor_feature_table.mat", was generated using data from two sources. The chemical composition of the odorants was found on PubChem at https://pubchem.ncbi.nlm.nih.gov/. The flavor category and irritant status were found in the Good Scent Company’s public database at http://www.thegoodscentscompany.com/
