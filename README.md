# Botify Technical SEO Health Dashboard Block

Use the Botify Technical SEO Health Dashboard to ensure greater visibility of your SEO data throughout your organization. Use Looker’s interface and tools to create custom alerts, see trends over long periods of time, or merge your SEO data with data from other channels for deeper analysis. Create deeper, more meaningful reports to view data by segment, or by custom date ranges to see where the biggest impacts can be made. A sample of the analysis in this block includes:


* **Visits and Visit Quality Data -** Spot trends in visits by segment or for the entire site to see how rankings and on-site user behavior is changing.
* **Indexability -** quickly identify abnormal trends in non-compliance to spot any technical vulnerabilities before they become an issue for traffic or revenue.
* **Server Log Analysis -** track trends over time for crawl ratio, and how different technical metrics like load times impact crawl metrics.


## How to implement this Block

Connect the database of your choosing to your Looker account. Contact your CSM for more information on automating the export of Botify data to your database of choice. Use the file [bql.json](https://github.com/kyle-botify/botify-looker-ml/blob/master/bql.json) to get an idea of which fields the dashboard uses by default, and which data from the Botify platform can be added. Feel free to work with your Botify account team on adding or removing datapoints to the export.

Download the LookML files and drag them into your LookML project, or copy and paste the text.

Rename the `connection_name` and `schema_name` constants in the manifest file (`manifest.lkml`) with your own. If you decided to rename the filenames of explore, model name and view, then please make sure to update all mentions within the other files, else this will result in errors.

[More on Developing Looker Models](https://docs.looker.com/data-modeling/getting-started/model-development)

###### LookML model:
* Botify_look

###### Dashboards*:
* botify_technical_health_dashboard

###### Views:
* export.view


<br>
<u>Dashboards*</u>
The Dashboard assumes that you are utilizing the full Botify datamodel. If you are not currently using the conversion feature, or Botify Log Analyzer, some of the charts may have errors.


## What if I find an error or discrepancy? Suggestions for improvements?
If you have feedback for improvements or find any errors, feel free to create a "New Issue" in the github repository for this Block.

Please note that the dashboard you are able to build are entirely dependent on what data you choose to export from Botify. Please discuss with your Botify CSM or Professional Services team to discuss the automated exports feature.

[Botify](https://www.botify.com)

====================================================================================================================
<br>
Copyright 2019

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
