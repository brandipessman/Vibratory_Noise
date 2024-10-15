# Spatial and temporal variation in ambient vibratory noise and its impact potential on a common urban arthropod

The following data and code are provided as a reference for the associated publication in [Entomologia Experimentalis et Applicata](https://doi.org/10.1111/eea.13487). This publication was written in association with my Ph.D. dissertation.

Access PDF: [View PDF](./manuscript.pdf)

![Alt text](./GraphicalAbstract.png)

## Who:

> > 👩 Authors: **Brandi Pessman**, Rowan McGinley, and Eileen Hebets

> > 🕷️ S️tudy Organism: *Agelenopsis pennsylvanica* (the funnel-weaving spider or grass spider)

## What:

> > The use of vibratory information is widespread across arthropods, and disruption in this sensory channel from human-induced noise is likely. We quantified variation in vibratory noise across an urban-rural microhabitat and the adult season of the funnel-weaving spider (Agelenopsis pennsylvanica). Vibratory noise varied spatially in urban areas and seasonally in rural areas and was linked to traffic and harvesting, respectively. We found that A. pennsylvanica collected from urban and rural habitats had complex responses to using a variable vibratory microhabitat.

The code presented in this repository walks through the analysis of this data, including:

-   Principal Component Analysis (PCA) to reduce dimensionality of traffic variables ([1_pca_analysis.Rmd](./1_pca_analysis.Rmd))

-   Wrangling/munging the data files ([2_data_wrangling.Rmd](./2_data_wrangling.Rmd))

-   Utilizing [USDA data](https://quickstats.nass.usda.gov/) about 2020 crop harvest in Lancaster County, Nebraska ([3_USDA_harvest_2020.Rmd](./3_USDA_harvest_2020.Rmd))

-   Running statistical analysis ([4_noise_analysis.Rmd](./4_noise_analysis.Rmd), [6_choice_trials.Rmd](./6_choice_trials.Rmd), [8_activity_levels.Rmd](./8_activity_levels.Rmd))

-   Assessing frequency profiles of vibrations in the field ([5_noise_frequency_profiles.Rmd](./5_noise_frequency_profiles.Rmd)) and in the microhabitat use trials ([7_choice_vibration_map.Rmd](./7_choice_vibration_map.Rmd))

-   Making publication-ready figures and tables ([9_publication_figures.Rmd](./9_publication_figures.Rmd), [10_publication_tables.Rmd](./10_publication_tables.Rmd))

## When:

> > 📓 Date Collected: Field Recordings: Aug. 3-Oct. 24, 2020 and Aug. 11-20, 2022; Microhabitat Use Trials: Sep. 13-Oct. 7, 2022

> > 📖 Date Published: June 14, 2024

## Where:

> > 📓 Data collected in: Lincoln, Nebraska

> > 📖 Data published in: *Entomologia Experimentalis et Applicata*

## Why:

> > Animals distribute themselves within habitats based on a variety of environmental conditions, including those impacted by urbanization. Suspected global declines in urban arthropod biodiversity have required that we examine how urban conditions affect the distribution of this ecologically important group. Traffic impacts and road presence likely introduce vibrations to the ground that could disrupt vibratory information acquisition, potentially leading urban spiders to adjust their location to minimize noise impacts. The use of vibratory information is widespread among many urban-dwelling arthropods, and future research is needed to determine if vibratory noise could play a role in the global decline of urban arthropod biodiversity.

## How:

> > 💻 R programming language

Analyses include:

-   Principal Component Analysis (PCA) ([1_pca_analysis.Rmd](./1_pca_analysis.Rmd))
-   Linear mixed-effect (LME) models and robust LME models ([4_noise_analysis.Rmd](./4_noise_analysis.Rmd))
-   Generalized linear models with binomial, beta, and negative binomial distributions ([6_choice_trials.Rmd](./6_choice_trials.Rmd), [8_activity_levels.Rmd](./8_activity_levels.Rmd))
-   Bootstrapping for LME and GLME model predictions ([4_noise_analysis.Rmd](./4_noise_analysis.Rmd), [6_choice_trials.Rmd](./6_choice_trials.Rmd))


> > 🎶️ Raven Pro Software for the analysis of vibrations
