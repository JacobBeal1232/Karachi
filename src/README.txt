The main.pl script is used to ask the user what question they would like answered.
Using preprocessed CSV files the main.pl script uses an Rsorter.pm module that contains sub functions to do calculations and output graphs answering the question.

Instructions:
1. Ensure StatsCan and the Optional Canadian Census is preprocessed by:
  1.1 Download the StatsCan CPI CSV from here:
  https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000413
  Select 'download options' and then 'CSV/Download entire table'

  1.2(OPTIONAL) If answering question 2, download Canadian Census Data from here:
  https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/details/download-telecharger/comp/page_dl-tc.cfm?Lang=E
  Select 'Canada, provinces, territories, census divisions and census subdivisions/CSV/

  1.3 Drag the CSV you desire to have processed into the preprocessor folder

  1.4 Run preprocessor.pl in the following format:
  'perl preprocessor.pl <FILENAME.csv> <QUESTIONNUMBER>'
  for instance, if you wished to preprocess the CPI for question 1, you might enter
  'perl preprocessor.pl statsCPI.csv 1'

  1.5 Wait for your file to process - when it's done, it will appear in the same folder as the perl file with the format
  'priceIndex<Number>.csv', or in the case of the census data, 'censusData.csv'

  1.6 Drop the file into the 'lib' folder.

2. From the 'src' folder run main.pl in the following format:
'perl main.pl'

3. Follow prompts to choose which question you would like answered.

4. After question processing is finished the answered will be plotted to a graph in the 'bin' folder.
