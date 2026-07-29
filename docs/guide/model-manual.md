# Model Manual

## Software and hardware requirements

### Software requirements 

The OMNIA model is a TIMES model generator; the TIMES source code is available under a [GNU GENERAL PUBLIC LICENSE v. 3.0](http://www.gnu.org/licenses/gpl-3.0.html) and can be accessed directly from [Github](https://github.com/etsap-TIMES/TIMES_model) and [Zenodo](https://zenodo.org/record/4660551). TIMES uses a data handling system, VEDA2.0, which is a proprietary, robust model management system which handles all aspects of working with TIMES. A fully functional 60-day evaluation version can be provided (other information about VEDA2.0 installation is available at: [VEDA Installation](https://veda-documentation.readthedocs.io/en/latest/pages/Getting%20started.html#installation)). In addition to VEDA2.0, TIMES models use the GAMS programming language. GAMS is proprietary software, and a valid license is required. Some purchase options for the GAMS version for TIMES and VEDA2.0 are available [here](http://www.kanors-emr.org/AcquiringTools.php). Moreover, for most of the TIMES model applications, a linear programming (LP) solver will be appropriate; more advanced features require the use of a mixed integer programming (MIP) solver or a non-linear solver (NLP). Solvers may be open source or proprietary and are either integrated as part of the GAMS system or should be capable of being called from GAMS. VEDA 2.0 supports multiple solvers; the usual solver used to run TIMES models is the proprietary solver CPLEX, but the framework also allows to run also with GUROBI (proprietary), CBC and others (free and open sources).

Finally, the OMNIA model is designed using Excel files, which VEDA uses in the background, thus, MS Office is a prerequisite software. The data input and data elaboration in OMNIA are handled directly in the Excel files or through Python scripts, information is available in each model template and additional information about data elaboration and scripts are available in the GitHub repository under the folder “Data and elaboration”.

### Hardware requirements

Hardware needed depends on the size and complexity of models, but here is a configuration suitable for typical TIMES models under Veda2.0:

1.  > CPU: A Minimum of 4 cores is recommended for STANDARD and ADVANCED licenses. 8 - 16 would be desirable for larger models

<!-- end list -->

2. > RAM: 4-8 GB is enough for Veda, but GAMS needs more RAM for larger models. 32 GB would accommodate most models

3. > HDD: 500GB - 1TB free space for Veda and GAMS files

## How to run the model with VEDA 2.0

The following steps are required to run the OMNIA model on VEDA 2.0.

1.  <span class="underline">Loading the model:</span> From the **Start Page**, load the model into the VEDA 2.0 software by clicking on the folder button and indicating the folder path where the model is located.

2.  <span class="underline">Synchronising the model</span>: All the model files should now be listed on the Navigator page. They initially appear with an orange background. By clicking on the synchronisation button, the process should start. At the end of the process, the files’ background changes to blue. Double-clicking on the file’s name, the corresponding Excel workbook opens which can be modified. After every modification, it is necessary to repeat the synchronisation process. For multiple modifications, it is suggested that a synchronisation from scratch is performed by clicking the **Start from scratch** button on the top left of the Navigator page.

3.  <span class="underline">Browsing the model:</span> Once the model is synchronised, it is possible to browse all the data loaded on the **Browse** page. This step is suggested to check if the data from the Excel workbooks is correctly loaded. VEDA will use the data displayed on this page to run the scenario.

4.  <span class="underline">Running the scenario:</span> Modelled scenarios are solved from the Run Manager page ({numref}`fig-run-manager`). First, it is necessary to create a *Case* (in the bottom window of the page) and then create a *scenario group* by selecting only the needed files from the **Scenario Groups** window. By double-clicking on the created case, it is possible to set the preferred configuration (horizon, scenario group, etc.) before clicking on the **Solve** button. In the *Settings* window, it is possible to set the configuration of the solver and define the folder where the results will be located.

5.  <span class="underline">Visualising the results:</span> The results of the solved cases can be navigated in the **Results** page. Tables can be manually created by selecting the preferred elements (attributes, process and commodity sets, periods, regions, etc.). Graphs can also be created to help visualise the results.

```{figure} ../images/image65.png
:name: fig-run-manager
:alt: Run Manager page in VEDA 2.0
:width: 90%

Run Manager page in VEDA 2.0.
