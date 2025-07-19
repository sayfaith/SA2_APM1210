{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "8a6d10d1",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:47.282411Z",
     "iopub.status.busy": "2025-07-19T00:12:47.280136Z",
     "iopub.status.idle": "2025-07-19T00:12:48.236535Z",
     "shell.execute_reply": "2025-07-19T00:12:48.234049Z"
    },
    "papermill": {
     "duration": 0.966627,
     "end_time": "2025-07-19T00:12:48.240021",
     "exception": false,
     "start_time": "2025-07-19T00:12:47.273394",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘dplyr’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    filter, lag\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    intersect, setdiff, setequal, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(readxl)\n",
    "library(dplyr)\n",
    "library(tidyr)\n",
    "library(stringr)\n",
    "library(readr)\n",
    "library(ggplot2)\n",
    "library(patchwork)\n",
    "\n",
    "suppressWarnings({\n",
    "  dengue <- read_excel(\"/kaggle/input/dengue-dataset/Dengue.xlsx\", skip = 8)\n",
    "})"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "52c9ed17",
   "metadata": {
    "papermill": {
     "duration": 0.004005,
     "end_time": "2025-07-19T00:12:48.248647",
     "exception": false,
     "start_time": "2025-07-19T00:12:48.244642",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Cleaning Dengue Cases and Deaths by Region**\t\t\t\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "badad243",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:48.363880Z",
     "iopub.status.busy": "2025-07-19T00:12:48.260190Z",
     "iopub.status.idle": "2025-07-19T00:12:48.729989Z",
     "shell.execute_reply": "2025-07-19T00:12:48.727696Z"
    },
    "papermill": {
     "duration": 0.480646,
     "end_time": "2025-07-19T00:12:48.733439",
     "exception": false,
     "start_time": "2025-07-19T00:12:48.252793",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 55 × 17</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Region</th><th scope=col>46389</th><th scope=col>415</th><th scope=col>57818</th><th scope=col>548</th><th scope=col>173029</th><th scope=col>1057</th><th scope=col>125975</th><th scope=col>654</th><th scope=col>187031</th><th scope=col>921</th><th scope=col>204906</th><th scope=col>660</th><th scope=col>121580</th><th scope=col>465</th><th scope=col>213930</th><th scope=col>647</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>NCR                                                </td><td>13975</td><td>90    </td><td>12763</td><td>122   </td><td>23644 </td><td>133   </td><td>28040 </td><td>161   </td><td>35796 </td><td>143   </td><td>23437 </td><td>52    </td><td>8929  </td><td>44    </td><td>26804 </td><td>115   </td></tr>\n",
       "\t<tr><td>CAR                                                </td><td>590  </td><td>2     </td><td>1849 </td><td>6     </td><td>6297  </td><td>13    </td><td>4695  </td><td>19    </td><td>5751  </td><td>12    </td><td>8718  </td><td>17    </td><td>2582  </td><td>7     </td><td>10403 </td><td>11    </td></tr>\n",
       "\t<tr><td>I                                                  </td><td>3375 </td><td>29    </td><td>2793 </td><td>26    </td><td>5580  </td><td>41    </td><td>14389 </td><td>73    </td><td>9619  </td><td>42    </td><td>16564 </td><td>46    </td><td>6985  </td><td>18    </td><td>17605 </td><td>41    </td></tr>\n",
       "\t<tr><td>II                                                 </td><td>1210 </td><td>13    </td><td>2226 </td><td>38    </td><td>6105  </td><td>37    </td><td>9673  </td><td>45    </td><td>7886  </td><td>30    </td><td>15946 </td><td>27    </td><td>3854  </td><td>17    </td><td>13855 </td><td>17    </td></tr>\n",
       "\t<tr><td>III                                                </td><td>7141 </td><td>58    </td><td>2932 </td><td>34    </td><td>10710 </td><td>67    </td><td>26878 </td><td>59    </td><td>28360 </td><td>61    </td><td>20615 </td><td>34    </td><td>14471 </td><td>19    </td><td>37047 </td><td>49    </td></tr>\n",
       "\t<tr><td>IVA                                                </td><td>4159 </td><td>31    </td><td>7215 </td><td>42    </td><td>24851 </td><td>106   </td><td>17567 </td><td>107   </td><td>29843 </td><td>121   </td><td>30219 </td><td>64    </td><td>15111 </td><td>30    </td><td>36033 </td><td>109   </td></tr>\n",
       "\t<tr><td>IVB                                                </td><td>273  </td><td>4     </td><td>171  </td><td>2     </td><td>2242  </td><td>26    </td><td>1580  </td><td>9     </td><td>2346  </td><td>12    </td><td>5108  </td><td>14    </td><td>2591  </td><td>15    </td><td>3632  </td><td>10    </td></tr>\n",
       "\t<tr><td>V                                                  </td><td>650  </td><td>7     </td><td>1213 </td><td>3     </td><td>3327  </td><td>19    </td><td>1715  </td><td>7     </td><td>3777  </td><td>13    </td><td>2973  </td><td>15    </td><td>2329  </td><td>11    </td><td>2014  </td><td>8     </td></tr>\n",
       "\t<tr><td>VI                                                 </td><td>2246 </td><td>20    </td><td>5241 </td><td>84    </td><td>27400 </td><td>137   </td><td>3206  </td><td>39    </td><td>11880 </td><td>97    </td><td>22461 </td><td>69    </td><td>8489  </td><td>27    </td><td>10353 </td><td>26    </td></tr>\n",
       "\t<tr><td>VII                                                </td><td>3424 </td><td>96    </td><td>7070 </td><td>79    </td><td>15362 </td><td>116   </td><td>5373  </td><td>26    </td><td>19193 </td><td>89    </td><td>15853 </td><td>57    </td><td>6566  </td><td>26    </td><td>14423 </td><td>87    </td></tr>\n",
       "\t<tr><td>VIII                                               </td><td>905  </td><td>11    </td><td>1101 </td><td>13    </td><td>12022 </td><td>93    </td><td>867   </td><td>6     </td><td>1669  </td><td>12    </td><td>3750  </td><td>12    </td><td>5239  </td><td>21    </td><td>2011  </td><td>5     </td></tr>\n",
       "\t<tr><td>IX                                                 </td><td>2172 </td><td>8     </td><td>1630 </td><td>9     </td><td>4917  </td><td>46    </td><td>1592  </td><td>23    </td><td>5498  </td><td>42    </td><td>5959  </td><td>42    </td><td>6755  </td><td>28    </td><td>6982  </td><td>22    </td></tr>\n",
       "\t<tr><td>X                                                  </td><td>1073 </td><td>14    </td><td>2239 </td><td>26    </td><td>7414  </td><td>58    </td><td>2000  </td><td>8     </td><td>6550  </td><td>48    </td><td>5361  </td><td>49    </td><td>11752 </td><td>65    </td><td>10303 </td><td>44    </td></tr>\n",
       "\t<tr><td>XI                                                 </td><td>3168 </td><td>18    </td><td>4179 </td><td>35    </td><td>9165  </td><td>86    </td><td>4178  </td><td>37    </td><td>10107 </td><td>109   </td><td>10886 </td><td>62    </td><td>8561  </td><td>44    </td><td>5057  </td><td>21    </td></tr>\n",
       "\t<tr><td>XII                                                </td><td>1102 </td><td>6     </td><td>3242 </td><td>10    </td><td>9937  </td><td>55    </td><td>2735  </td><td>26    </td><td>4573  </td><td>53    </td><td>13064 </td><td>68    </td><td>7247  </td><td>40    </td><td>9586  </td><td>31    </td></tr>\n",
       "\t<tr><td>Caraga                                             </td><td>663  </td><td>5     </td><td>1548 </td><td>11    </td><td>3126  </td><td>13    </td><td>1208  </td><td>5     </td><td>2724  </td><td>23    </td><td>3593  </td><td>29    </td><td>8618  </td><td>43    </td><td>6701  </td><td>41    </td></tr>\n",
       "\t<tr><td>ARMM                                               </td><td>263  </td><td>3     </td><td>406  </td><td>8     </td><td>930   </td><td>11    </td><td>279   </td><td>4     </td><td>1459  </td><td>14    </td><td>399   </td><td>3     </td><td>1501  </td><td>10    </td><td>1121  </td><td>10    </td></tr>\n",
       "\t<tr><td>Source: Department of Health                       </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>Table 5.5.1b                                       </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>VECTOR BORNE DISEASES CASES AND DEATHS BY SEX      </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>Dengue                                             </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>2008-2015                                          </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>2008 </td><td>NA    </td><td>2009 </td><td>NA    </td><td>2010  </td><td>NA    </td><td>2011  </td><td>NA    </td><td>2012  </td><td>NA    </td><td>2013  </td><td>NA    </td><td>2014  </td><td>NA    </td><td>2015  </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>Cases</td><td>Deaths</td><td>Cases</td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>Philippines                                        </td><td>46389</td><td>415   </td><td>57818</td><td>548   </td><td>173029</td><td>1057  </td><td>125975</td><td>654   </td><td>187031</td><td>921   </td><td>204906</td><td>660   </td><td>121580</td><td>465   </td><td>213930</td><td>647   </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>Female                                             </td><td>21968</td><td>232   </td><td>27439</td><td>288   </td><td>83302 </td><td>573   </td><td>58853 </td><td>370   </td><td>88243 </td><td>519   </td><td>95763 </td><td>339   </td><td>57166 </td><td>242   </td><td>100953</td><td>366   </td></tr>\n",
       "\t<tr><td>Male                                               </td><td>24421</td><td>183   </td><td>30379</td><td>260   </td><td>89727 </td><td>484   </td><td>67122 </td><td>284   </td><td>98788 </td><td>402   </td><td>109143</td><td>321   </td><td>64414 </td><td>223   </td><td>112977</td><td>281   </td></tr>\n",
       "\t<tr><td>Source: Department of Health                       </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>Table 5.5.1c                                       </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>VECTOR BORNE DISEASES CASES AND DEATHS BY AGE GROUP</td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>Dengue                                             </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>2008-2015                                          </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>2008 </td><td>NA    </td><td>2009 </td><td>NA    </td><td>2010  </td><td>NA    </td><td>2011  </td><td>NA    </td><td>2012  </td><td>NA    </td><td>2013  </td><td>NA    </td><td>2014  </td><td>NA    </td><td>2015  </td><td>NA    </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>Cases</td><td>Deaths</td><td>Cases</td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td><td>Cases </td><td>Deaths</td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td>Philippines                                        </td><td>46389</td><td>415   </td><td>57818</td><td>548   </td><td>173029</td><td>1057  </td><td>125975</td><td>654   </td><td>187031</td><td>921   </td><td>204906</td><td>660   </td><td>121580</td><td>465   </td><td>213930</td><td>647   </td></tr>\n",
       "\t<tr><td>NA                                                 </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>&lt;1                                                 </span></td><td><span style=white-space:pre-wrap>-    </span></td><td><span style=white-space:pre-wrap>-     </span></td><td><span style=white-space:pre-wrap>109  </span></td><td><span style=white-space:pre-wrap>4     </span></td><td><span style=white-space:pre-wrap>130   </span></td><td><span style=white-space:pre-wrap>0     </span></td><td><span style=white-space:pre-wrap>1     </span></td><td><span style=white-space:pre-wrap>0     </span></td><td><span style=white-space:pre-wrap>4017  </span></td><td><span style=white-space:pre-wrap>39    </span></td><td><span style=white-space:pre-wrap>4124  </span></td><td><span style=white-space:pre-wrap>26    </span></td><td><span style=white-space:pre-wrap>2870  </span></td><td><span style=white-space:pre-wrap>14    </span></td><td><span style=white-space:pre-wrap>4304  </span></td><td><span style=white-space:pre-wrap>22    </span></td></tr>\n",
       "\t<tr><td>1–4                                                </td><td>1298 </td><td>18    </td><td>1839 </td><td>23    </td><td>4932  </td><td>58    </td><td>3087  </td><td>24    </td><td>24824 </td><td>255   </td><td>26225 </td><td>149   </td><td>14956 </td><td>108   </td><td>23428 </td><td>173   </td></tr>\n",
       "\t<tr><td>5–14                                               </td><td>6141 </td><td>112   </td><td>8001 </td><td>155   </td><td>24548 </td><td>281   </td><td>17413 </td><td>165   </td><td>80565 </td><td>458   </td><td>83525 </td><td>337   </td><td>47513 </td><td>203   </td><td>81803 </td><td>306   </td></tr>\n",
       "\t<tr><td>15–24                                              </td><td>21406</td><td>225   </td><td>25697</td><td>270   </td><td>77119 </td><td>549   </td><td>54585 </td><td>310   </td><td>49557 </td><td>95    </td><td>54442 </td><td>77    </td><td>32559 </td><td>55    </td><td>59890 </td><td>60    </td></tr>\n",
       "\t<tr><td>25–39                                              </td><td>11792</td><td>38    </td><td>14647</td><td>44    </td><td>44505 </td><td>93    </td><td>33250 </td><td>70    </td><td>19009 </td><td>38    </td><td>23512 </td><td>31    </td><td>14590 </td><td>36    </td><td>27664 </td><td>41    </td></tr>\n",
       "\t<tr><td>40–64                                              </td><td>4144 </td><td>13    </td><td>5297 </td><td>29    </td><td>15338 </td><td>39    </td><td>12097 </td><td>42    </td><td>7265  </td><td>23    </td><td>10775 </td><td>22    </td><td>7184  </td><td>38    </td><td>13476 </td><td>33    </td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>65 &amp; up                                            </span></td><td>1393 </td><td><span style=white-space:pre-wrap>7     </span></td><td>1879 </td><td><span style=white-space:pre-wrap>20    </span></td><td><span style=white-space:pre-wrap>5491  </span></td><td><span style=white-space:pre-wrap>30    </span></td><td><span style=white-space:pre-wrap>4638  </span></td><td><span style=white-space:pre-wrap>34    </span></td><td><span style=white-space:pre-wrap>1320  </span></td><td><span style=white-space:pre-wrap>5     </span></td><td><span style=white-space:pre-wrap>2076  </span></td><td><span style=white-space:pre-wrap>17    </span></td><td><span style=white-space:pre-wrap>1670  </span></td><td><span style=white-space:pre-wrap>11    </span></td><td><span style=white-space:pre-wrap>2967  </span></td><td><span style=white-space:pre-wrap>12    </span></td></tr>\n",
       "\t<tr><td>Unspecified                                        </td><td>215  </td><td>2     </td><td>349  </td><td>3     </td><td>966   </td><td>7     </td><td>904   </td><td>9     </td><td>474   </td><td>8     </td><td>227   </td><td>1     </td><td>238   </td><td>0     </td><td>398   </td><td>0     </td></tr>\n",
       "\t<tr><td>Source: Department of Health                       </td><td>NA   </td><td>NA    </td><td>NA   </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td><td>NA    </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 55 × 17\n",
       "\\begin{tabular}{lllllllllllllllll}\n",
       " Region & 46389 & 415 & 57818 & 548 & 173029 & 1057 & 125975 & 654 & 187031 & 921 & 204906 & 660 & 121580 & 465 & 213930 & 647\\\\\n",
       " <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t NCR                                                 & 13975 & 90     & 12763 & 122    & 23644  & 133    & 28040  & 161    & 35796  & 143    & 23437  & 52     & 8929   & 44     & 26804  & 115   \\\\\n",
       "\t CAR                                                 & 590   & 2      & 1849  & 6      & 6297   & 13     & 4695   & 19     & 5751   & 12     & 8718   & 17     & 2582   & 7      & 10403  & 11    \\\\\n",
       "\t I                                                   & 3375  & 29     & 2793  & 26     & 5580   & 41     & 14389  & 73     & 9619   & 42     & 16564  & 46     & 6985   & 18     & 17605  & 41    \\\\\n",
       "\t II                                                  & 1210  & 13     & 2226  & 38     & 6105   & 37     & 9673   & 45     & 7886   & 30     & 15946  & 27     & 3854   & 17     & 13855  & 17    \\\\\n",
       "\t III                                                 & 7141  & 58     & 2932  & 34     & 10710  & 67     & 26878  & 59     & 28360  & 61     & 20615  & 34     & 14471  & 19     & 37047  & 49    \\\\\n",
       "\t IVA                                                 & 4159  & 31     & 7215  & 42     & 24851  & 106    & 17567  & 107    & 29843  & 121    & 30219  & 64     & 15111  & 30     & 36033  & 109   \\\\\n",
       "\t IVB                                                 & 273   & 4      & 171   & 2      & 2242   & 26     & 1580   & 9      & 2346   & 12     & 5108   & 14     & 2591   & 15     & 3632   & 10    \\\\\n",
       "\t V                                                   & 650   & 7      & 1213  & 3      & 3327   & 19     & 1715   & 7      & 3777   & 13     & 2973   & 15     & 2329   & 11     & 2014   & 8     \\\\\n",
       "\t VI                                                  & 2246  & 20     & 5241  & 84     & 27400  & 137    & 3206   & 39     & 11880  & 97     & 22461  & 69     & 8489   & 27     & 10353  & 26    \\\\\n",
       "\t VII                                                 & 3424  & 96     & 7070  & 79     & 15362  & 116    & 5373   & 26     & 19193  & 89     & 15853  & 57     & 6566   & 26     & 14423  & 87    \\\\\n",
       "\t VIII                                                & 905   & 11     & 1101  & 13     & 12022  & 93     & 867    & 6      & 1669   & 12     & 3750   & 12     & 5239   & 21     & 2011   & 5     \\\\\n",
       "\t IX                                                  & 2172  & 8      & 1630  & 9      & 4917   & 46     & 1592   & 23     & 5498   & 42     & 5959   & 42     & 6755   & 28     & 6982   & 22    \\\\\n",
       "\t X                                                   & 1073  & 14     & 2239  & 26     & 7414   & 58     & 2000   & 8      & 6550   & 48     & 5361   & 49     & 11752  & 65     & 10303  & 44    \\\\\n",
       "\t XI                                                  & 3168  & 18     & 4179  & 35     & 9165   & 86     & 4178   & 37     & 10107  & 109    & 10886  & 62     & 8561   & 44     & 5057   & 21    \\\\\n",
       "\t XII                                                 & 1102  & 6      & 3242  & 10     & 9937   & 55     & 2735   & 26     & 4573   & 53     & 13064  & 68     & 7247   & 40     & 9586   & 31    \\\\\n",
       "\t Caraga                                              & 663   & 5      & 1548  & 11     & 3126   & 13     & 1208   & 5      & 2724   & 23     & 3593   & 29     & 8618   & 43     & 6701   & 41    \\\\\n",
       "\t ARMM                                                & 263   & 3      & 406   & 8      & 930    & 11     & 279    & 4      & 1459   & 14     & 399    & 3      & 1501   & 10     & 1121   & 10    \\\\\n",
       "\t Source: Department of Health                        & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t Table 5.5.1b                                        & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t VECTOR BORNE DISEASES CASES AND DEATHS BY SEX       & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t Dengue                                              & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t 2008-2015                                           & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t NA                                                  & 2008  & NA     & 2009  & NA     & 2010   & NA     & 2011   & NA     & 2012   & NA     & 2013   & NA     & 2014   & NA     & 2015   & NA    \\\\\n",
       "\t NA                                                  & Cases & Deaths & Cases & Deaths & Cases  & Deaths & Cases  & Deaths & Cases  & Deaths & Cases  & Deaths & Cases  & Deaths & Cases  & Deaths\\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t Philippines                                         & 46389 & 415    & 57818 & 548    & 173029 & 1057   & 125975 & 654    & 187031 & 921    & 204906 & 660    & 121580 & 465    & 213930 & 647   \\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t Female                                              & 21968 & 232    & 27439 & 288    & 83302  & 573    & 58853  & 370    & 88243  & 519    & 95763  & 339    & 57166  & 242    & 100953 & 366   \\\\\n",
       "\t Male                                                & 24421 & 183    & 30379 & 260    & 89727  & 484    & 67122  & 284    & 98788  & 402    & 109143 & 321    & 64414  & 223    & 112977 & 281   \\\\\n",
       "\t Source: Department of Health                        & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t Table 5.5.1c                                        & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t VECTOR BORNE DISEASES CASES AND DEATHS BY AGE GROUP & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t Dengue                                              & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t 2008-2015                                           & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t NA                                                  & 2008  & NA     & 2009  & NA     & 2010   & NA     & 2011   & NA     & 2012   & NA     & 2013   & NA     & 2014   & NA     & 2015   & NA    \\\\\n",
       "\t NA                                                  & Cases & Deaths & Cases & Deaths & Cases  & Deaths & Cases  & Deaths & Cases  & Deaths & Cases  & Deaths & Cases  & Deaths & Cases  & Deaths\\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t Philippines                                         & 46389 & 415    & 57818 & 548    & 173029 & 1057   & 125975 & 654    & 187031 & 921    & 204906 & 660    & 121580 & 465    & 213930 & 647   \\\\\n",
       "\t NA                                                  & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\t <1                                                  & -     & -      & 109   & 4      & 130    & 0      & 1      & 0      & 4017   & 39     & 4124   & 26     & 2870   & 14     & 4304   & 22    \\\\\n",
       "\t 1–4                                                 & 1298  & 18     & 1839  & 23     & 4932   & 58     & 3087   & 24     & 24824  & 255    & 26225  & 149    & 14956  & 108    & 23428  & 173   \\\\\n",
       "\t 5–14                                                & 6141  & 112    & 8001  & 155    & 24548  & 281    & 17413  & 165    & 80565  & 458    & 83525  & 337    & 47513  & 203    & 81803  & 306   \\\\\n",
       "\t 15–24                                               & 21406 & 225    & 25697 & 270    & 77119  & 549    & 54585  & 310    & 49557  & 95     & 54442  & 77     & 32559  & 55     & 59890  & 60    \\\\\n",
       "\t 25–39                                               & 11792 & 38     & 14647 & 44     & 44505  & 93     & 33250  & 70     & 19009  & 38     & 23512  & 31     & 14590  & 36     & 27664  & 41    \\\\\n",
       "\t 40–64                                               & 4144  & 13     & 5297  & 29     & 15338  & 39     & 12097  & 42     & 7265   & 23     & 10775  & 22     & 7184   & 38     & 13476  & 33    \\\\\n",
       "\t 65 \\& up                                             & 1393  & 7      & 1879  & 20     & 5491   & 30     & 4638   & 34     & 1320   & 5      & 2076   & 17     & 1670   & 11     & 2967   & 12    \\\\\n",
       "\t Unspecified                                         & 215   & 2      & 349   & 3      & 966    & 7      & 904    & 9      & 474    & 8      & 227    & 1      & 238    & 0      & 398    & 0     \\\\\n",
       "\t Source: Department of Health                        & NA    & NA     & NA    & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA     & NA    \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 55 × 17\n",
       "\n",
       "| Region &lt;chr&gt; | 46389 &lt;chr&gt; | 415 &lt;chr&gt; | 57818 &lt;chr&gt; | 548 &lt;chr&gt; | 173029 &lt;chr&gt; | 1057 &lt;chr&gt; | 125975 &lt;chr&gt; | 654 &lt;chr&gt; | 187031 &lt;chr&gt; | 921 &lt;chr&gt; | 204906 &lt;chr&gt; | 660 &lt;chr&gt; | 121580 &lt;chr&gt; | 465 &lt;chr&gt; | 213930 &lt;chr&gt; | 647 &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| NCR                                                 | 13975 | 90     | 12763 | 122    | 23644  | 133    | 28040  | 161    | 35796  | 143    | 23437  | 52     | 8929   | 44     | 26804  | 115    |\n",
       "| CAR                                                 | 590   | 2      | 1849  | 6      | 6297   | 13     | 4695   | 19     | 5751   | 12     | 8718   | 17     | 2582   | 7      | 10403  | 11     |\n",
       "| I                                                   | 3375  | 29     | 2793  | 26     | 5580   | 41     | 14389  | 73     | 9619   | 42     | 16564  | 46     | 6985   | 18     | 17605  | 41     |\n",
       "| II                                                  | 1210  | 13     | 2226  | 38     | 6105   | 37     | 9673   | 45     | 7886   | 30     | 15946  | 27     | 3854   | 17     | 13855  | 17     |\n",
       "| III                                                 | 7141  | 58     | 2932  | 34     | 10710  | 67     | 26878  | 59     | 28360  | 61     | 20615  | 34     | 14471  | 19     | 37047  | 49     |\n",
       "| IVA                                                 | 4159  | 31     | 7215  | 42     | 24851  | 106    | 17567  | 107    | 29843  | 121    | 30219  | 64     | 15111  | 30     | 36033  | 109    |\n",
       "| IVB                                                 | 273   | 4      | 171   | 2      | 2242   | 26     | 1580   | 9      | 2346   | 12     | 5108   | 14     | 2591   | 15     | 3632   | 10     |\n",
       "| V                                                   | 650   | 7      | 1213  | 3      | 3327   | 19     | 1715   | 7      | 3777   | 13     | 2973   | 15     | 2329   | 11     | 2014   | 8      |\n",
       "| VI                                                  | 2246  | 20     | 5241  | 84     | 27400  | 137    | 3206   | 39     | 11880  | 97     | 22461  | 69     | 8489   | 27     | 10353  | 26     |\n",
       "| VII                                                 | 3424  | 96     | 7070  | 79     | 15362  | 116    | 5373   | 26     | 19193  | 89     | 15853  | 57     | 6566   | 26     | 14423  | 87     |\n",
       "| VIII                                                | 905   | 11     | 1101  | 13     | 12022  | 93     | 867    | 6      | 1669   | 12     | 3750   | 12     | 5239   | 21     | 2011   | 5      |\n",
       "| IX                                                  | 2172  | 8      | 1630  | 9      | 4917   | 46     | 1592   | 23     | 5498   | 42     | 5959   | 42     | 6755   | 28     | 6982   | 22     |\n",
       "| X                                                   | 1073  | 14     | 2239  | 26     | 7414   | 58     | 2000   | 8      | 6550   | 48     | 5361   | 49     | 11752  | 65     | 10303  | 44     |\n",
       "| XI                                                  | 3168  | 18     | 4179  | 35     | 9165   | 86     | 4178   | 37     | 10107  | 109    | 10886  | 62     | 8561   | 44     | 5057   | 21     |\n",
       "| XII                                                 | 1102  | 6      | 3242  | 10     | 9937   | 55     | 2735   | 26     | 4573   | 53     | 13064  | 68     | 7247   | 40     | 9586   | 31     |\n",
       "| Caraga                                              | 663   | 5      | 1548  | 11     | 3126   | 13     | 1208   | 5      | 2724   | 23     | 3593   | 29     | 8618   | 43     | 6701   | 41     |\n",
       "| ARMM                                                | 263   | 3      | 406   | 8      | 930    | 11     | 279    | 4      | 1459   | 14     | 399    | 3      | 1501   | 10     | 1121   | 10     |\n",
       "| Source: Department of Health                        | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| Table 5.5.1b                                        | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| VECTOR BORNE DISEASES CASES AND DEATHS BY SEX       | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| Dengue                                              | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| 2008-2015                                           | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| NA                                                  | 2008  | NA     | 2009  | NA     | 2010   | NA     | 2011   | NA     | 2012   | NA     | 2013   | NA     | 2014   | NA     | 2015   | NA     |\n",
       "| NA                                                  | Cases | Deaths | Cases | Deaths | Cases  | Deaths | Cases  | Deaths | Cases  | Deaths | Cases  | Deaths | Cases  | Deaths | Cases  | Deaths |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| Philippines                                         | 46389 | 415    | 57818 | 548    | 173029 | 1057   | 125975 | 654    | 187031 | 921    | 204906 | 660    | 121580 | 465    | 213930 | 647    |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| Female                                              | 21968 | 232    | 27439 | 288    | 83302  | 573    | 58853  | 370    | 88243  | 519    | 95763  | 339    | 57166  | 242    | 100953 | 366    |\n",
       "| Male                                                | 24421 | 183    | 30379 | 260    | 89727  | 484    | 67122  | 284    | 98788  | 402    | 109143 | 321    | 64414  | 223    | 112977 | 281    |\n",
       "| Source: Department of Health                        | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| Table 5.5.1c                                        | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| VECTOR BORNE DISEASES CASES AND DEATHS BY AGE GROUP | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| Dengue                                              | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| 2008-2015                                           | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| NA                                                  | 2008  | NA     | 2009  | NA     | 2010   | NA     | 2011   | NA     | 2012   | NA     | 2013   | NA     | 2014   | NA     | 2015   | NA     |\n",
       "| NA                                                  | Cases | Deaths | Cases | Deaths | Cases  | Deaths | Cases  | Deaths | Cases  | Deaths | Cases  | Deaths | Cases  | Deaths | Cases  | Deaths |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| Philippines                                         | 46389 | 415    | 57818 | 548    | 173029 | 1057   | 125975 | 654    | 187031 | 921    | 204906 | 660    | 121580 | 465    | 213930 | 647    |\n",
       "| NA                                                  | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "| &lt;1                                                  | -     | -      | 109   | 4      | 130    | 0      | 1      | 0      | 4017   | 39     | 4124   | 26     | 2870   | 14     | 4304   | 22     |\n",
       "| 1–4                                                 | 1298  | 18     | 1839  | 23     | 4932   | 58     | 3087   | 24     | 24824  | 255    | 26225  | 149    | 14956  | 108    | 23428  | 173    |\n",
       "| 5–14                                                | 6141  | 112    | 8001  | 155    | 24548  | 281    | 17413  | 165    | 80565  | 458    | 83525  | 337    | 47513  | 203    | 81803  | 306    |\n",
       "| 15–24                                               | 21406 | 225    | 25697 | 270    | 77119  | 549    | 54585  | 310    | 49557  | 95     | 54442  | 77     | 32559  | 55     | 59890  | 60     |\n",
       "| 25–39                                               | 11792 | 38     | 14647 | 44     | 44505  | 93     | 33250  | 70     | 19009  | 38     | 23512  | 31     | 14590  | 36     | 27664  | 41     |\n",
       "| 40–64                                               | 4144  | 13     | 5297  | 29     | 15338  | 39     | 12097  | 42     | 7265   | 23     | 10775  | 22     | 7184   | 38     | 13476  | 33     |\n",
       "| 65 &amp; up                                             | 1393  | 7      | 1879  | 20     | 5491   | 30     | 4638   | 34     | 1320   | 5      | 2076   | 17     | 1670   | 11     | 2967   | 12     |\n",
       "| Unspecified                                         | 215   | 2      | 349   | 3      | 966    | 7      | 904    | 9      | 474    | 8      | 227    | 1      | 238    | 0      | 398    | 0      |\n",
       "| Source: Department of Health                        | NA    | NA     | NA    | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     | NA     |\n",
       "\n"
      ],
      "text/plain": [
       "   Region                                              46389 415    57818\n",
       "1  NA                                                  NA    NA     NA   \n",
       "2  NCR                                                 13975 90     12763\n",
       "3  CAR                                                 590   2      1849 \n",
       "4  I                                                   3375  29     2793 \n",
       "5  II                                                  1210  13     2226 \n",
       "6  III                                                 7141  58     2932 \n",
       "7  IVA                                                 4159  31     7215 \n",
       "8  IVB                                                 273   4      171  \n",
       "9  V                                                   650   7      1213 \n",
       "10 VI                                                  2246  20     5241 \n",
       "11 VII                                                 3424  96     7070 \n",
       "12 VIII                                                905   11     1101 \n",
       "13 IX                                                  2172  8      1630 \n",
       "14 X                                                   1073  14     2239 \n",
       "15 XI                                                  3168  18     4179 \n",
       "16 XII                                                 1102  6      3242 \n",
       "17 Caraga                                              663   5      1548 \n",
       "18 ARMM                                                263   3      406  \n",
       "19 Source: Department of Health                        NA    NA     NA   \n",
       "20 NA                                                  NA    NA     NA   \n",
       "21 NA                                                  NA    NA     NA   \n",
       "22 Table 5.5.1b                                        NA    NA     NA   \n",
       "23 VECTOR BORNE DISEASES CASES AND DEATHS BY SEX       NA    NA     NA   \n",
       "24 Dengue                                              NA    NA     NA   \n",
       "25 2008-2015                                           NA    NA     NA   \n",
       "26 NA                                                  NA    NA     NA   \n",
       "27 NA                                                  2008  NA     2009 \n",
       "28 NA                                                  Cases Deaths Cases\n",
       "29 NA                                                  NA    NA     NA   \n",
       "30 Philippines                                         46389 415    57818\n",
       "31 NA                                                  NA    NA     NA   \n",
       "32 Female                                              21968 232    27439\n",
       "33 Male                                                24421 183    30379\n",
       "34 Source: Department of Health                        NA    NA     NA   \n",
       "35 NA                                                  NA    NA     NA   \n",
       "36 NA                                                  NA    NA     NA   \n",
       "37 Table 5.5.1c                                        NA    NA     NA   \n",
       "38 VECTOR BORNE DISEASES CASES AND DEATHS BY AGE GROUP NA    NA     NA   \n",
       "39 Dengue                                              NA    NA     NA   \n",
       "40 2008-2015                                           NA    NA     NA   \n",
       "41 NA                                                  NA    NA     NA   \n",
       "42 NA                                                  2008  NA     2009 \n",
       "43 NA                                                  Cases Deaths Cases\n",
       "44 NA                                                  NA    NA     NA   \n",
       "45 Philippines                                         46389 415    57818\n",
       "46 NA                                                  NA    NA     NA   \n",
       "47 <1                                                  -     -      109  \n",
       "48 1–4                                                 1298  18     1839 \n",
       "49 5–14                                                6141  112    8001 \n",
       "50 15–24                                               21406 225    25697\n",
       "51 25–39                                               11792 38     14647\n",
       "52 40–64                                               4144  13     5297 \n",
       "53 65 & up                                             1393  7      1879 \n",
       "54 Unspecified                                         215   2      349  \n",
       "55 Source: Department of Health                        NA    NA     NA   \n",
       "   548    173029 1057   125975 654    187031 921    204906 660    121580 465   \n",
       "1  NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "2  122    23644  133    28040  161    35796  143    23437  52     8929   44    \n",
       "3  6      6297   13     4695   19     5751   12     8718   17     2582   7     \n",
       "4  26     5580   41     14389  73     9619   42     16564  46     6985   18    \n",
       "5  38     6105   37     9673   45     7886   30     15946  27     3854   17    \n",
       "6  34     10710  67     26878  59     28360  61     20615  34     14471  19    \n",
       "7  42     24851  106    17567  107    29843  121    30219  64     15111  30    \n",
       "8  2      2242   26     1580   9      2346   12     5108   14     2591   15    \n",
       "9  3      3327   19     1715   7      3777   13     2973   15     2329   11    \n",
       "10 84     27400  137    3206   39     11880  97     22461  69     8489   27    \n",
       "11 79     15362  116    5373   26     19193  89     15853  57     6566   26    \n",
       "12 13     12022  93     867    6      1669   12     3750   12     5239   21    \n",
       "13 9      4917   46     1592   23     5498   42     5959   42     6755   28    \n",
       "14 26     7414   58     2000   8      6550   48     5361   49     11752  65    \n",
       "15 35     9165   86     4178   37     10107  109    10886  62     8561   44    \n",
       "16 10     9937   55     2735   26     4573   53     13064  68     7247   40    \n",
       "17 11     3126   13     1208   5      2724   23     3593   29     8618   43    \n",
       "18 8      930    11     279    4      1459   14     399    3      1501   10    \n",
       "19 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "20 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "21 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "22 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "23 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "24 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "25 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "26 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "27 NA     2010   NA     2011   NA     2012   NA     2013   NA     2014   NA    \n",
       "28 Deaths Cases  Deaths Cases  Deaths Cases  Deaths Cases  Deaths Cases  Deaths\n",
       "29 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "30 548    173029 1057   125975 654    187031 921    204906 660    121580 465   \n",
       "31 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "32 288    83302  573    58853  370    88243  519    95763  339    57166  242   \n",
       "33 260    89727  484    67122  284    98788  402    109143 321    64414  223   \n",
       "34 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "35 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "36 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "37 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "38 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "39 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "40 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "41 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "42 NA     2010   NA     2011   NA     2012   NA     2013   NA     2014   NA    \n",
       "43 Deaths Cases  Deaths Cases  Deaths Cases  Deaths Cases  Deaths Cases  Deaths\n",
       "44 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "45 548    173029 1057   125975 654    187031 921    204906 660    121580 465   \n",
       "46 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "47 4      130    0      1      0      4017   39     4124   26     2870   14    \n",
       "48 23     4932   58     3087   24     24824  255    26225  149    14956  108   \n",
       "49 155    24548  281    17413  165    80565  458    83525  337    47513  203   \n",
       "50 270    77119  549    54585  310    49557  95     54442  77     32559  55    \n",
       "51 44     44505  93     33250  70     19009  38     23512  31     14590  36    \n",
       "52 29     15338  39     12097  42     7265   23     10775  22     7184   38    \n",
       "53 20     5491   30     4638   34     1320   5      2076   17     1670   11    \n",
       "54 3      966    7      904    9      474    8      227    1      238    0     \n",
       "55 NA     NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    \n",
       "   213930 647   \n",
       "1  NA     NA    \n",
       "2  26804  115   \n",
       "3  10403  11    \n",
       "4  17605  41    \n",
       "5  13855  17    \n",
       "6  37047  49    \n",
       "7  36033  109   \n",
       "8  3632   10    \n",
       "9  2014   8     \n",
       "10 10353  26    \n",
       "11 14423  87    \n",
       "12 2011   5     \n",
       "13 6982   22    \n",
       "14 10303  44    \n",
       "15 5057   21    \n",
       "16 9586   31    \n",
       "17 6701   41    \n",
       "18 1121   10    \n",
       "19 NA     NA    \n",
       "20 NA     NA    \n",
       "21 NA     NA    \n",
       "22 NA     NA    \n",
       "23 NA     NA    \n",
       "24 NA     NA    \n",
       "25 NA     NA    \n",
       "26 NA     NA    \n",
       "27 2015   NA    \n",
       "28 Cases  Deaths\n",
       "29 NA     NA    \n",
       "30 213930 647   \n",
       "31 NA     NA    \n",
       "32 100953 366   \n",
       "33 112977 281   \n",
       "34 NA     NA    \n",
       "35 NA     NA    \n",
       "36 NA     NA    \n",
       "37 NA     NA    \n",
       "38 NA     NA    \n",
       "39 NA     NA    \n",
       "40 NA     NA    \n",
       "41 NA     NA    \n",
       "42 2015   NA    \n",
       "43 Cases  Deaths\n",
       "44 NA     NA    \n",
       "45 213930 647   \n",
       "46 NA     NA    \n",
       "47 4304   22    \n",
       "48 23428  173   \n",
       "49 81803  306   \n",
       "50 59890  60    \n",
       "51 27664  41    \n",
       "52 13476  33    \n",
       "53 2967   12    \n",
       "54 398    0     \n",
       "55 NA     NA    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# name first column to region\n",
    "\n",
    "names(dengue)[1] <- \"Region\"\n",
    "\n",
    "dengue"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "c2bfd737",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:48.750386Z",
     "iopub.status.busy": "2025-07-19T00:12:48.748049Z",
     "iopub.status.idle": "2025-07-19T00:12:48.859033Z",
     "shell.execute_reply": "2025-07-19T00:12:48.856850Z"
    },
    "papermill": {
     "duration": 0.122367,
     "end_time": "2025-07-19T00:12:48.861878",
     "exception": false,
     "start_time": "2025-07-19T00:12:48.739511",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 17 × 17</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Region</th><th scope=col>46389</th><th scope=col>415</th><th scope=col>57818</th><th scope=col>548</th><th scope=col>173029</th><th scope=col>1057</th><th scope=col>125975</th><th scope=col>654</th><th scope=col>187031</th><th scope=col>921</th><th scope=col>204906</th><th scope=col>660</th><th scope=col>121580</th><th scope=col>465</th><th scope=col>213930</th><th scope=col>647</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>NCR   </td><td>13975</td><td>90</td><td>12763</td><td>122</td><td>23644</td><td>133</td><td>28040</td><td>161</td><td>35796</td><td>143</td><td>23437</td><td>52</td><td>8929 </td><td>44</td><td>26804</td><td>115</td></tr>\n",
       "\t<tr><td>CAR   </td><td>590  </td><td>2 </td><td>1849 </td><td>6  </td><td>6297 </td><td>13 </td><td>4695 </td><td>19 </td><td>5751 </td><td>12 </td><td>8718 </td><td>17</td><td>2582 </td><td>7 </td><td>10403</td><td>11 </td></tr>\n",
       "\t<tr><td>I     </td><td>3375 </td><td>29</td><td>2793 </td><td>26 </td><td>5580 </td><td>41 </td><td>14389</td><td>73 </td><td>9619 </td><td>42 </td><td>16564</td><td>46</td><td>6985 </td><td>18</td><td>17605</td><td>41 </td></tr>\n",
       "\t<tr><td>II    </td><td>1210 </td><td>13</td><td>2226 </td><td>38 </td><td>6105 </td><td>37 </td><td>9673 </td><td>45 </td><td>7886 </td><td>30 </td><td>15946</td><td>27</td><td>3854 </td><td>17</td><td>13855</td><td>17 </td></tr>\n",
       "\t<tr><td>III   </td><td>7141 </td><td>58</td><td>2932 </td><td>34 </td><td>10710</td><td>67 </td><td>26878</td><td>59 </td><td>28360</td><td>61 </td><td>20615</td><td>34</td><td>14471</td><td>19</td><td>37047</td><td>49 </td></tr>\n",
       "\t<tr><td>IVA   </td><td>4159 </td><td>31</td><td>7215 </td><td>42 </td><td>24851</td><td>106</td><td>17567</td><td>107</td><td>29843</td><td>121</td><td>30219</td><td>64</td><td>15111</td><td>30</td><td>36033</td><td>109</td></tr>\n",
       "\t<tr><td>IVB   </td><td>273  </td><td>4 </td><td>171  </td><td>2  </td><td>2242 </td><td>26 </td><td>1580 </td><td>9  </td><td>2346 </td><td>12 </td><td>5108 </td><td>14</td><td>2591 </td><td>15</td><td>3632 </td><td>10 </td></tr>\n",
       "\t<tr><td>V     </td><td>650  </td><td>7 </td><td>1213 </td><td>3  </td><td>3327 </td><td>19 </td><td>1715 </td><td>7  </td><td>3777 </td><td>13 </td><td>2973 </td><td>15</td><td>2329 </td><td>11</td><td>2014 </td><td>8  </td></tr>\n",
       "\t<tr><td>VI    </td><td>2246 </td><td>20</td><td>5241 </td><td>84 </td><td>27400</td><td>137</td><td>3206 </td><td>39 </td><td>11880</td><td>97 </td><td>22461</td><td>69</td><td>8489 </td><td>27</td><td>10353</td><td>26 </td></tr>\n",
       "\t<tr><td>VII   </td><td>3424 </td><td>96</td><td>7070 </td><td>79 </td><td>15362</td><td>116</td><td>5373 </td><td>26 </td><td>19193</td><td>89 </td><td>15853</td><td>57</td><td>6566 </td><td>26</td><td>14423</td><td>87 </td></tr>\n",
       "\t<tr><td>VIII  </td><td>905  </td><td>11</td><td>1101 </td><td>13 </td><td>12022</td><td>93 </td><td>867  </td><td>6  </td><td>1669 </td><td>12 </td><td>3750 </td><td>12</td><td>5239 </td><td>21</td><td>2011 </td><td>5  </td></tr>\n",
       "\t<tr><td>IX    </td><td>2172 </td><td>8 </td><td>1630 </td><td>9  </td><td>4917 </td><td>46 </td><td>1592 </td><td>23 </td><td>5498 </td><td>42 </td><td>5959 </td><td>42</td><td>6755 </td><td>28</td><td>6982 </td><td>22 </td></tr>\n",
       "\t<tr><td>X     </td><td>1073 </td><td>14</td><td>2239 </td><td>26 </td><td>7414 </td><td>58 </td><td>2000 </td><td>8  </td><td>6550 </td><td>48 </td><td>5361 </td><td>49</td><td>11752</td><td>65</td><td>10303</td><td>44 </td></tr>\n",
       "\t<tr><td>XI    </td><td>3168 </td><td>18</td><td>4179 </td><td>35 </td><td>9165 </td><td>86 </td><td>4178 </td><td>37 </td><td>10107</td><td>109</td><td>10886</td><td>62</td><td>8561 </td><td>44</td><td>5057 </td><td>21 </td></tr>\n",
       "\t<tr><td>XII   </td><td>1102 </td><td>6 </td><td>3242 </td><td>10 </td><td>9937 </td><td>55 </td><td>2735 </td><td>26 </td><td>4573 </td><td>53 </td><td>13064</td><td>68</td><td>7247 </td><td>40</td><td>9586 </td><td>31 </td></tr>\n",
       "\t<tr><td>Caraga</td><td>663  </td><td>5 </td><td>1548 </td><td>11 </td><td>3126 </td><td>13 </td><td>1208 </td><td>5  </td><td>2724 </td><td>23 </td><td>3593 </td><td>29</td><td>8618 </td><td>43</td><td>6701 </td><td>41 </td></tr>\n",
       "\t<tr><td>ARMM  </td><td>263  </td><td>3 </td><td>406  </td><td>8  </td><td>930  </td><td>11 </td><td>279  </td><td>4  </td><td>1459 </td><td>14 </td><td>399  </td><td>3 </td><td>1501 </td><td>10</td><td>1121 </td><td>10 </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 17 × 17\n",
       "\\begin{tabular}{lllllllllllllllll}\n",
       " Region & 46389 & 415 & 57818 & 548 & 173029 & 1057 & 125975 & 654 & 187031 & 921 & 204906 & 660 & 121580 & 465 & 213930 & 647\\\\\n",
       " <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t NCR    & 13975 & 90 & 12763 & 122 & 23644 & 133 & 28040 & 161 & 35796 & 143 & 23437 & 52 & 8929  & 44 & 26804 & 115\\\\\n",
       "\t CAR    & 590   & 2  & 1849  & 6   & 6297  & 13  & 4695  & 19  & 5751  & 12  & 8718  & 17 & 2582  & 7  & 10403 & 11 \\\\\n",
       "\t I      & 3375  & 29 & 2793  & 26  & 5580  & 41  & 14389 & 73  & 9619  & 42  & 16564 & 46 & 6985  & 18 & 17605 & 41 \\\\\n",
       "\t II     & 1210  & 13 & 2226  & 38  & 6105  & 37  & 9673  & 45  & 7886  & 30  & 15946 & 27 & 3854  & 17 & 13855 & 17 \\\\\n",
       "\t III    & 7141  & 58 & 2932  & 34  & 10710 & 67  & 26878 & 59  & 28360 & 61  & 20615 & 34 & 14471 & 19 & 37047 & 49 \\\\\n",
       "\t IVA    & 4159  & 31 & 7215  & 42  & 24851 & 106 & 17567 & 107 & 29843 & 121 & 30219 & 64 & 15111 & 30 & 36033 & 109\\\\\n",
       "\t IVB    & 273   & 4  & 171   & 2   & 2242  & 26  & 1580  & 9   & 2346  & 12  & 5108  & 14 & 2591  & 15 & 3632  & 10 \\\\\n",
       "\t V      & 650   & 7  & 1213  & 3   & 3327  & 19  & 1715  & 7   & 3777  & 13  & 2973  & 15 & 2329  & 11 & 2014  & 8  \\\\\n",
       "\t VI     & 2246  & 20 & 5241  & 84  & 27400 & 137 & 3206  & 39  & 11880 & 97  & 22461 & 69 & 8489  & 27 & 10353 & 26 \\\\\n",
       "\t VII    & 3424  & 96 & 7070  & 79  & 15362 & 116 & 5373  & 26  & 19193 & 89  & 15853 & 57 & 6566  & 26 & 14423 & 87 \\\\\n",
       "\t VIII   & 905   & 11 & 1101  & 13  & 12022 & 93  & 867   & 6   & 1669  & 12  & 3750  & 12 & 5239  & 21 & 2011  & 5  \\\\\n",
       "\t IX     & 2172  & 8  & 1630  & 9   & 4917  & 46  & 1592  & 23  & 5498  & 42  & 5959  & 42 & 6755  & 28 & 6982  & 22 \\\\\n",
       "\t X      & 1073  & 14 & 2239  & 26  & 7414  & 58  & 2000  & 8   & 6550  & 48  & 5361  & 49 & 11752 & 65 & 10303 & 44 \\\\\n",
       "\t XI     & 3168  & 18 & 4179  & 35  & 9165  & 86  & 4178  & 37  & 10107 & 109 & 10886 & 62 & 8561  & 44 & 5057  & 21 \\\\\n",
       "\t XII    & 1102  & 6  & 3242  & 10  & 9937  & 55  & 2735  & 26  & 4573  & 53  & 13064 & 68 & 7247  & 40 & 9586  & 31 \\\\\n",
       "\t Caraga & 663   & 5  & 1548  & 11  & 3126  & 13  & 1208  & 5   & 2724  & 23  & 3593  & 29 & 8618  & 43 & 6701  & 41 \\\\\n",
       "\t ARMM   & 263   & 3  & 406   & 8   & 930   & 11  & 279   & 4   & 1459  & 14  & 399   & 3  & 1501  & 10 & 1121  & 10 \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 17 × 17\n",
       "\n",
       "| Region &lt;chr&gt; | 46389 &lt;chr&gt; | 415 &lt;chr&gt; | 57818 &lt;chr&gt; | 548 &lt;chr&gt; | 173029 &lt;chr&gt; | 1057 &lt;chr&gt; | 125975 &lt;chr&gt; | 654 &lt;chr&gt; | 187031 &lt;chr&gt; | 921 &lt;chr&gt; | 204906 &lt;chr&gt; | 660 &lt;chr&gt; | 121580 &lt;chr&gt; | 465 &lt;chr&gt; | 213930 &lt;chr&gt; | 647 &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| NCR    | 13975 | 90 | 12763 | 122 | 23644 | 133 | 28040 | 161 | 35796 | 143 | 23437 | 52 | 8929  | 44 | 26804 | 115 |\n",
       "| CAR    | 590   | 2  | 1849  | 6   | 6297  | 13  | 4695  | 19  | 5751  | 12  | 8718  | 17 | 2582  | 7  | 10403 | 11  |\n",
       "| I      | 3375  | 29 | 2793  | 26  | 5580  | 41  | 14389 | 73  | 9619  | 42  | 16564 | 46 | 6985  | 18 | 17605 | 41  |\n",
       "| II     | 1210  | 13 | 2226  | 38  | 6105  | 37  | 9673  | 45  | 7886  | 30  | 15946 | 27 | 3854  | 17 | 13855 | 17  |\n",
       "| III    | 7141  | 58 | 2932  | 34  | 10710 | 67  | 26878 | 59  | 28360 | 61  | 20615 | 34 | 14471 | 19 | 37047 | 49  |\n",
       "| IVA    | 4159  | 31 | 7215  | 42  | 24851 | 106 | 17567 | 107 | 29843 | 121 | 30219 | 64 | 15111 | 30 | 36033 | 109 |\n",
       "| IVB    | 273   | 4  | 171   | 2   | 2242  | 26  | 1580  | 9   | 2346  | 12  | 5108  | 14 | 2591  | 15 | 3632  | 10  |\n",
       "| V      | 650   | 7  | 1213  | 3   | 3327  | 19  | 1715  | 7   | 3777  | 13  | 2973  | 15 | 2329  | 11 | 2014  | 8   |\n",
       "| VI     | 2246  | 20 | 5241  | 84  | 27400 | 137 | 3206  | 39  | 11880 | 97  | 22461 | 69 | 8489  | 27 | 10353 | 26  |\n",
       "| VII    | 3424  | 96 | 7070  | 79  | 15362 | 116 | 5373  | 26  | 19193 | 89  | 15853 | 57 | 6566  | 26 | 14423 | 87  |\n",
       "| VIII   | 905   | 11 | 1101  | 13  | 12022 | 93  | 867   | 6   | 1669  | 12  | 3750  | 12 | 5239  | 21 | 2011  | 5   |\n",
       "| IX     | 2172  | 8  | 1630  | 9   | 4917  | 46  | 1592  | 23  | 5498  | 42  | 5959  | 42 | 6755  | 28 | 6982  | 22  |\n",
       "| X      | 1073  | 14 | 2239  | 26  | 7414  | 58  | 2000  | 8   | 6550  | 48  | 5361  | 49 | 11752 | 65 | 10303 | 44  |\n",
       "| XI     | 3168  | 18 | 4179  | 35  | 9165  | 86  | 4178  | 37  | 10107 | 109 | 10886 | 62 | 8561  | 44 | 5057  | 21  |\n",
       "| XII    | 1102  | 6  | 3242  | 10  | 9937  | 55  | 2735  | 26  | 4573  | 53  | 13064 | 68 | 7247  | 40 | 9586  | 31  |\n",
       "| Caraga | 663   | 5  | 1548  | 11  | 3126  | 13  | 1208  | 5   | 2724  | 23  | 3593  | 29 | 8618  | 43 | 6701  | 41  |\n",
       "| ARMM   | 263   | 3  | 406   | 8   | 930   | 11  | 279   | 4   | 1459  | 14  | 399   | 3  | 1501  | 10 | 1121  | 10  |\n",
       "\n"
      ],
      "text/plain": [
       "   Region 46389 415 57818 548 173029 1057 125975 654 187031 921 204906 660\n",
       "1  NCR    13975 90  12763 122 23644  133  28040  161 35796  143 23437  52 \n",
       "2  CAR    590   2   1849  6   6297   13   4695   19  5751   12  8718   17 \n",
       "3  I      3375  29  2793  26  5580   41   14389  73  9619   42  16564  46 \n",
       "4  II     1210  13  2226  38  6105   37   9673   45  7886   30  15946  27 \n",
       "5  III    7141  58  2932  34  10710  67   26878  59  28360  61  20615  34 \n",
       "6  IVA    4159  31  7215  42  24851  106  17567  107 29843  121 30219  64 \n",
       "7  IVB    273   4   171   2   2242   26   1580   9   2346   12  5108   14 \n",
       "8  V      650   7   1213  3   3327   19   1715   7   3777   13  2973   15 \n",
       "9  VI     2246  20  5241  84  27400  137  3206   39  11880  97  22461  69 \n",
       "10 VII    3424  96  7070  79  15362  116  5373   26  19193  89  15853  57 \n",
       "11 VIII   905   11  1101  13  12022  93   867    6   1669   12  3750   12 \n",
       "12 IX     2172  8   1630  9   4917   46   1592   23  5498   42  5959   42 \n",
       "13 X      1073  14  2239  26  7414   58   2000   8   6550   48  5361   49 \n",
       "14 XI     3168  18  4179  35  9165   86   4178   37  10107  109 10886  62 \n",
       "15 XII    1102  6   3242  10  9937   55   2735   26  4573   53  13064  68 \n",
       "16 Caraga 663   5   1548  11  3126   13   1208   5   2724   23  3593   29 \n",
       "17 ARMM   263   3   406   8   930    11   279    4   1459   14  399    3  \n",
       "   121580 465 213930 647\n",
       "1  8929   44  26804  115\n",
       "2  2582   7   10403  11 \n",
       "3  6985   18  17605  41 \n",
       "4  3854   17  13855  17 \n",
       "5  14471  19  37047  49 \n",
       "6  15111  30  36033  109\n",
       "7  2591   15  3632   10 \n",
       "8  2329   11  2014   8  \n",
       "9  8489   27  10353  26 \n",
       "10 6566   26  14423  87 \n",
       "11 5239   21  2011   5  \n",
       "12 6755   28  6982   22 \n",
       "13 11752  65  10303  44 \n",
       "14 8561   44  5057   21 \n",
       "15 7247   40  9586   31 \n",
       "16 8618   43  6701   41 \n",
       "17 1501   10  1121   10 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Removing other table and nan values\n",
    "\n",
    "drop_other_tables <- which(dengue[[1]] == \"ARMM\")[1]\n",
    "\n",
    "dengue <- dengue[1:drop_other_tables, ]\n",
    "\n",
    "dengue <- dengue %>%\n",
    "  filter(!is.na(Region))\n",
    "\n",
    "dengue"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "be8cf930",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:48.877627Z",
     "iopub.status.busy": "2025-07-19T00:12:48.875714Z",
     "iopub.status.idle": "2025-07-19T00:12:48.971765Z",
     "shell.execute_reply": "2025-07-19T00:12:48.969659Z"
    },
    "papermill": {
     "duration": 0.106922,
     "end_time": "2025-07-19T00:12:48.974426",
     "exception": false,
     "start_time": "2025-07-19T00:12:48.867504",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Region</th><th scope=col>Year</th><th scope=col>Cases</th><th scope=col>Deaths</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>NCR</td><td>2008</td><td>13975</td><td>90 </td></tr>\n",
       "\t<tr><td>NCR</td><td>2009</td><td>12763</td><td>122</td></tr>\n",
       "\t<tr><td>NCR</td><td>2010</td><td>23644</td><td>133</td></tr>\n",
       "\t<tr><td>NCR</td><td>2011</td><td>28040</td><td>161</td></tr>\n",
       "\t<tr><td>NCR</td><td>2012</td><td>35796</td><td>143</td></tr>\n",
       "\t<tr><td>NCR</td><td>2013</td><td>23437</td><td>52 </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Region & Year & Cases & Deaths\\\\\n",
       " <fct> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t NCR & 2008 & 13975 & 90 \\\\\n",
       "\t NCR & 2009 & 12763 & 122\\\\\n",
       "\t NCR & 2010 & 23644 & 133\\\\\n",
       "\t NCR & 2011 & 28040 & 161\\\\\n",
       "\t NCR & 2012 & 35796 & 143\\\\\n",
       "\t NCR & 2013 & 23437 & 52 \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 4\n",
       "\n",
       "| Region &lt;fct&gt; | Year &lt;chr&gt; | Cases &lt;chr&gt; | Deaths &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| NCR | 2008 | 13975 | 90  |\n",
       "| NCR | 2009 | 12763 | 122 |\n",
       "| NCR | 2010 | 23644 | 133 |\n",
       "| NCR | 2011 | 28040 | 161 |\n",
       "| NCR | 2012 | 35796 | 143 |\n",
       "| NCR | 2013 | 23437 | 52  |\n",
       "\n"
      ],
      "text/plain": [
       "  Region Year Cases Deaths\n",
       "1 NCR    2008 13975 90    \n",
       "2 NCR    2009 12763 122   \n",
       "3 NCR    2010 23644 133   \n",
       "4 NCR    2011 28040 161   \n",
       "5 NCR    2012 35796 143   \n",
       "6 NCR    2013 23437 52    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Keeping the order of the Region\n",
    "\n",
    "dengue$Region <- factor(dengue[[1]], levels = unique(dengue[[1]]))\n",
    "\n",
    "years <- c(\"Region\",\n",
    "                 paste0(rep(2008:2015, each = 2), \"_\", rep(c(\"Cases\", \"Deaths\"), times = 8)))\n",
    "\n",
    "colnames(dengue) <- years\n",
    "\n",
    "# Pivoting\n",
    "\n",
    "dengue_long <- dengue %>%\n",
    "  pivot_longer(\n",
    "    cols = -Region,\n",
    "    names_to = c(\"Year\", \"Metric\"),\n",
    "    names_sep = \"_\",\n",
    "    values_to = \"Value\"\n",
    "  ) %>%\n",
    "  pivot_wider(\n",
    "    names_from = Metric,\n",
    "    values_from = Value\n",
    "  )\n",
    "\n",
    "dengue_long <- dengue_long %>%\n",
    "  arrange(Region, Year)\n",
    "\n",
    "head(dengue_long)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "28552667",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:48.990519Z",
     "iopub.status.busy": "2025-07-19T00:12:48.988602Z",
     "iopub.status.idle": "2025-07-19T00:12:49.034113Z",
     "shell.execute_reply": "2025-07-19T00:12:49.031903Z"
    },
    "papermill": {
     "duration": 0.056989,
     "end_time": "2025-07-19T00:12:49.037152",
     "exception": false,
     "start_time": "2025-07-19T00:12:48.980163",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Region</th><th scope=col>Year</th><th scope=col>Cases</th><th scope=col>Deaths</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>NCR</td><td>2008</td><td>13975</td><td> 90</td></tr>\n",
       "\t<tr><td>NCR</td><td>2009</td><td>12763</td><td>122</td></tr>\n",
       "\t<tr><td>NCR</td><td>2010</td><td>23644</td><td>133</td></tr>\n",
       "\t<tr><td>NCR</td><td>2011</td><td>28040</td><td>161</td></tr>\n",
       "\t<tr><td>NCR</td><td>2012</td><td>35796</td><td>143</td></tr>\n",
       "\t<tr><td>NCR</td><td>2013</td><td>23437</td><td> 52</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Region & Year & Cases & Deaths\\\\\n",
       " <fct> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t NCR & 2008 & 13975 &  90\\\\\n",
       "\t NCR & 2009 & 12763 & 122\\\\\n",
       "\t NCR & 2010 & 23644 & 133\\\\\n",
       "\t NCR & 2011 & 28040 & 161\\\\\n",
       "\t NCR & 2012 & 35796 & 143\\\\\n",
       "\t NCR & 2013 & 23437 &  52\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 4\n",
       "\n",
       "| Region &lt;fct&gt; | Year &lt;int&gt; | Cases &lt;int&gt; | Deaths &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| NCR | 2008 | 13975 |  90 |\n",
       "| NCR | 2009 | 12763 | 122 |\n",
       "| NCR | 2010 | 23644 | 133 |\n",
       "| NCR | 2011 | 28040 | 161 |\n",
       "| NCR | 2012 | 35796 | 143 |\n",
       "| NCR | 2013 | 23437 |  52 |\n",
       "\n"
      ],
      "text/plain": [
       "  Region Year Cases Deaths\n",
       "1 NCR    2008 13975  90   \n",
       "2 NCR    2009 12763 122   \n",
       "3 NCR    2010 23644 133   \n",
       "4 NCR    2011 28040 161   \n",
       "5 NCR    2012 35796 143   \n",
       "6 NCR    2013 23437  52   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Converting Year, Cases, and Deaths to numeric\n",
    "\n",
    "dengue_long$Year <- as.integer(dengue_long$Year)\n",
    "dengue_long$Cases <- as.integer(gsub(\",\", \"\", dengue_long$Cases))\n",
    "dengue_long$Deaths <- as.integer(gsub(\",\", \"\", dengue_long$Deaths))\n",
    "\n",
    "head(dengue_long)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9ec5c9c5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-18T20:58:58.558570Z",
     "iopub.status.busy": "2025-07-18T20:58:58.556595Z",
     "iopub.status.idle": "2025-07-18T20:58:58.575191Z",
     "shell.execute_reply": "2025-07-18T20:58:58.571969Z"
    },
    "papermill": {
     "duration": 0.006125,
     "end_time": "2025-07-19T00:12:49.049273",
     "exception": false,
     "start_time": "2025-07-19T00:12:49.043148",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**EDA of Dengue by Region**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "2fe99fc0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:49.066426Z",
     "iopub.status.busy": "2025-07-19T00:12:49.064405Z",
     "iopub.status.idle": "2025-07-19T00:12:49.092532Z",
     "shell.execute_reply": "2025-07-19T00:12:49.090217Z"
    },
    "papermill": {
     "duration": 0.040095,
     "end_time": "2025-07-19T00:12:49.095852",
     "exception": false,
     "start_time": "2025-07-19T00:12:49.055757",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     Region        Year          Cases           Deaths      \n",
       " NCR    : 8   Min.   :2008   Min.   :  171   Min.   :  2.00  \n",
       " CAR    : 8   1st Qu.:2010   1st Qu.: 2241   1st Qu.: 12.00  \n",
       " I      : 8   Median :2012   Median : 5367   Median : 27.50  \n",
       " II     : 8   Mean   :2012   Mean   : 8314   Mean   : 39.46  \n",
       " III    : 8   3rd Qu.:2013   3rd Qu.:10754   3rd Qu.: 53.50  \n",
       " IVA    : 8   Max.   :2015   Max.   :37047   Max.   :161.00  \n",
       " (Other):88                                                  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(dengue_long)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "1c09d6c5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:49.113672Z",
     "iopub.status.busy": "2025-07-19T00:12:49.111516Z",
     "iopub.status.idle": "2025-07-19T00:12:49.943863Z",
     "shell.execute_reply": "2025-07-19T00:12:49.940328Z"
    },
    "papermill": {
     "duration": 0.845606,
     "end_time": "2025-07-19T00:12:49.947601",
     "exception": false,
     "start_time": "2025-07-19T00:12:49.101995",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd3wUdf7H8c9sTW806T10BBUBBTnFXlBU7KKeYj/0xBN75Tw5O/be6+nPqCd2\nTz2FREXREwsBFFGQlp5s3/n9MbCGsLuZZMtsvryef/BIZr77nc98Z+a7b2ZLNF3XBQAAAB2f\nzeoCAAAAkBwEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQRMcL\ndt7qhZqmOdw9YjV476C+mqaNm/+N8euSy8ZomnbQR2vTVaA6mn7/z2lTd+2c5+o24vI4zbTt\nONx5PfsPOfL0v73+zea0VWstPVRfdu/1M/af0HunztlOV2FJ17GTDrj0tqc3BcJWl5ZZbh9Y\nrGnawmpvnDaZc0ZVPrGXpml7PVGZzo0CQCI6XrBLNT3c+Omnn1Z8scbqQqx3zeQjH//gS+eQ\nyQfuNbjVxr0HDorYqci9fnXlK4/ecvjYnife/EEaSrVW428fHDCo5/Tzrnnp3YqNTdKtZzfN\nU7X003fmzzl5QOn+izbHCzGIJf1nFNc+AAWoH+z6zbjh8ccfnzO02GT7oGf5pEmT9j/qoZRW\n1QHo/jtX1jpzhq38/L0n7jut1eavfv1d5Va/rt9c+9uyey85xqH7n71k6hkv/5z6ci0T9Px4\nwMhD3v25vu+f/rywotJbt+nnn9fUNNZ/8/5z00eV1P/8/sG7n+vj7/a1XfrPKK59AApQP9h1\n2uWwU045Zd9u2VYX0sHoYU9A1505I3JsWjsentt92DnzX1h8z3QReXLmIevVfUXyiSP3+7TG\n2+vA6354/5GDdh+0Zakte9Q+x/3r86VTCt21qx47k3cCJGzHOaMAIBHqB7uMpvs2tOv5SQ81\nefyhpJeTdLue8+LJ3XIDTd+d886v7e0j3OgNJrOmpPJWvX7O27/aXd1ff+myrO0uJru79+0X\nDBeRt+a8a0FxaZLWA5SMMwoAVKZ+sFt63a4tPjxR9e0bs48/cFD3Tm6nq7BTr8mHnvZ8xe/G\nqueHdXbl7SIidb/coGlapyGPbX1Q+KOn/zFtr9FdivJcuYX9R+5x7jUPrfW1iFahN++5bK+R\n/fPdWV17Dzt17sOesIzIdeV3nxVp8cMDe2qadv7KmobVC4+bPDzPlfPUhiYR0UO1z9568dTd\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# histogram of both cases and deaths\n",
    "\n",
    "plot_data <- dengue_long %>%\n",
    "  pivot_longer(cols = c(Cases, Deaths), names_to = \"Measure\", values_to = \"Count\")\n",
    "\n",
    "ggplot(plot_data, aes(x = Count, fill = Measure)) +\n",
    "  geom_histogram(bins = 30, color = \"black\") +\n",
    "  facet_wrap(~ Measure, scales = \"free_x\") +\n",
    "  scale_fill_manual(values = c(\"Cases\" = \"steelblue\", \"Deaths\" = \"red\")) +\n",
    "  labs(title = \"Histogram of Dengue Cases and Deaths\",\n",
    "       x = \"Count\",\n",
    "       y = \"Frequency\") +\n",
    "  theme_minimal() +\n",
    "  theme(legend.position = \"none\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "6b9744bd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:49.966837Z",
     "iopub.status.busy": "2025-07-19T00:12:49.964511Z",
     "iopub.status.idle": "2025-07-19T00:12:50.328873Z",
     "shell.execute_reply": "2025-07-19T00:12:50.326055Z"
    },
    "papermill": {
     "duration": 0.377496,
     "end_time": "2025-07-19T00:12:50.332389",
     "exception": false,
     "start_time": "2025-07-19T00:12:49.954893",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n/PrFlR0/Y6hh+Y3nnDSkMDs1u/f07/zoy4aQvb2tY26c++isw0fkpCXlFQ447Yq768zI7FIr\nuPmuq84cM7goOT131NQ5Ty3e2v7+B62jY+yOOuqofbZZW9Z8sakycNgtv+tkEUA7ds2cKCp2\nthIAQKusLz41v+zsc0/PqLHG6HHt73P/2m0DRhU+Nu2lTx6ZJGJdNeGofzRP+P2T/x6a3fLy\ng9efN3FMwfZ1UzL9e+4mN02a9VLOWU++em9hSvjdv994/dlHnH1Kdf9kz/5r0sFLx036b/rJ\nf37ytT7e7Y9cdfG0iVK5/L62jlkYXDx69lVTfvro648e1lSy5Ltn/+DkYae8f91IEbl56vjH\n6qf89uG/Ds81lrzyu0uOGRReUf7d3l+0tf9B62iwa41RPOq406efd8/NEztTAdA+uzWx6pGj\n0jOcrgUA0Apr21bri087eRDVq89+H//5U1KTlTJ8KampSXUbbv3Tyuqny/51fmGaiBw+ecp7\nOT1/cM9Xn945fvfdRKTfZT994sJrZvVMEZFhA3923UOzP20M9k/ez/QLEala8eNn1gcXVD11\nTJZfREa/vWP2uX/fErTy/Uarx8ytn1tvWpdfee6R+akyYdxbL+WvSc0VkYbyB3+ztGJ+1d+m\nZieJyPiJU0P/zr3jyoXf/vOSVvfvjI4GuyVLlnTyTMDB+WbmBM9hAaCLMnr30fu72daRgxzQ\n/tsXLfClDvtuYZr9pfJk3DAo6/KXlsud4/fa87rrvz//1Zfu+WrVxo3rP3v/tY6fouzVxck9\njrdTnYikFVw6f/6l7RwzveiH5x3+5Lf69Z960vGTJ02aedLppxzaR0RqVs7V2prWI3n3g2cH\nV7W1f2d05o4dEHtaW5vLhAF2ANCFGaPH7fcpatRprUXU7ls8HqW1udduZkvpqcMP/TBr8mVz\nZk6ZffTF155z+JjZHTyF1WIpI3nf7W0d0/Dm/fXDsp8tmvu/BQsXvfPMPT+9etqP3njj7pm+\nrBTDm11bU7Z7ucrwG15fq/sfyLdhbwcW7JrKP/vnv+d9vX5zk+nNHzDy+NPPnFCc3pnTA+3T\n27ZIS4uwmBgAYE+9Jh8TavrVs1saz81PExFtNjywuqboskP32q165Q1vbApsCfynt88Qkabt\nz3b8FIWzRwd++dKyhtBh6T4Radr214Fjb3zy642HlbR+zG2LHrjrleBD9900fNLJ14p8/ejR\n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\nAACgif8HG5/2u3iESysAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Overall Trend\n",
    "\n",
    "yearly_trend <- dengue_long %>%\n",
    "  group_by(Year) %>%\n",
    "  summarise(\n",
    "    total_cases = sum(Cases, na.rm = TRUE),\n",
    "    total_deaths = sum(Deaths, na.rm = TRUE)\n",
    "  ) %>%\n",
    "  pivot_longer(cols = c(total_cases, total_deaths), names_to = \"Type\", values_to = \"Count\") %>%\n",
    "  ggplot(aes(x = Year, y = Count, color = Type)) +\n",
    "  geom_line() +\n",
    "  labs(title = \"Total Dengue Cases and Deaths by Year\",\n",
    "           y = \"Count\", x = \"Year\", color = \"Category\") +\n",
    "  theme_minimal()\n",
    "\n",
    "yearly_trend"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "020577e7",
   "metadata": {
    "papermill": {
     "duration": 0.007187,
     "end_time": "2025-07-19T00:12:50.347179",
     "exception": false,
     "start_time": "2025-07-19T00:12:50.339992",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Which region has the most or least dengue?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "51f741ac",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:50.365324Z",
     "iopub.status.busy": "2025-07-19T00:12:50.363678Z",
     "iopub.status.idle": "2025-07-19T00:12:50.405793Z",
     "shell.execute_reply": "2025-07-19T00:12:50.403287Z"
    },
    "papermill": {
     "duration": 0.054464,
     "end_time": "2025-07-19T00:12:50.408746",
     "exception": false,
     "start_time": "2025-07-19T00:12:50.354282",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 17 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Region</th><th scope=col>total_cases</th><th scope=col>total_deaths</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>NCR   </td><td>173388</td><td>860</td></tr>\n",
       "\t<tr><td>IVA   </td><td>164998</td><td>610</td></tr>\n",
       "\t<tr><td>III   </td><td>148154</td><td>381</td></tr>\n",
       "\t<tr><td>VI    </td><td> 91276</td><td>499</td></tr>\n",
       "\t<tr><td>VII   </td><td> 87264</td><td>576</td></tr>\n",
       "\t<tr><td>I     </td><td> 76910</td><td>316</td></tr>\n",
       "\t<tr><td>II    </td><td> 60755</td><td>224</td></tr>\n",
       "\t<tr><td>XI    </td><td> 55301</td><td>412</td></tr>\n",
       "\t<tr><td>XII   </td><td> 51486</td><td>289</td></tr>\n",
       "\t<tr><td>X     </td><td> 46692</td><td>312</td></tr>\n",
       "\t<tr><td>CAR   </td><td> 40885</td><td> 87</td></tr>\n",
       "\t<tr><td>IX    </td><td> 35505</td><td>220</td></tr>\n",
       "\t<tr><td>Caraga</td><td> 28181</td><td>170</td></tr>\n",
       "\t<tr><td>VIII  </td><td> 27564</td><td>173</td></tr>\n",
       "\t<tr><td>V     </td><td> 17998</td><td> 83</td></tr>\n",
       "\t<tr><td>IVB   </td><td> 17943</td><td> 92</td></tr>\n",
       "\t<tr><td>ARMM  </td><td>  6358</td><td> 63</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 17 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Region & total\\_cases & total\\_deaths\\\\\n",
       " <fct> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t NCR    & 173388 & 860\\\\\n",
       "\t IVA    & 164998 & 610\\\\\n",
       "\t III    & 148154 & 381\\\\\n",
       "\t VI     &  91276 & 499\\\\\n",
       "\t VII    &  87264 & 576\\\\\n",
       "\t I      &  76910 & 316\\\\\n",
       "\t II     &  60755 & 224\\\\\n",
       "\t XI     &  55301 & 412\\\\\n",
       "\t XII    &  51486 & 289\\\\\n",
       "\t X      &  46692 & 312\\\\\n",
       "\t CAR    &  40885 &  87\\\\\n",
       "\t IX     &  35505 & 220\\\\\n",
       "\t Caraga &  28181 & 170\\\\\n",
       "\t VIII   &  27564 & 173\\\\\n",
       "\t V      &  17998 &  83\\\\\n",
       "\t IVB    &  17943 &  92\\\\\n",
       "\t ARMM   &   6358 &  63\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 17 × 3\n",
       "\n",
       "| Region &lt;fct&gt; | total_cases &lt;int&gt; | total_deaths &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| NCR    | 173388 | 860 |\n",
       "| IVA    | 164998 | 610 |\n",
       "| III    | 148154 | 381 |\n",
       "| VI     |  91276 | 499 |\n",
       "| VII    |  87264 | 576 |\n",
       "| I      |  76910 | 316 |\n",
       "| II     |  60755 | 224 |\n",
       "| XI     |  55301 | 412 |\n",
       "| XII    |  51486 | 289 |\n",
       "| X      |  46692 | 312 |\n",
       "| CAR    |  40885 |  87 |\n",
       "| IX     |  35505 | 220 |\n",
       "| Caraga |  28181 | 170 |\n",
       "| VIII   |  27564 | 173 |\n",
       "| V      |  17998 |  83 |\n",
       "| IVB    |  17943 |  92 |\n",
       "| ARMM   |   6358 |  63 |\n",
       "\n"
      ],
      "text/plain": [
       "   Region total_cases total_deaths\n",
       "1  NCR    173388      860         \n",
       "2  IVA    164998      610         \n",
       "3  III    148154      381         \n",
       "4  VI      91276      499         \n",
       "5  VII     87264      576         \n",
       "6  I       76910      316         \n",
       "7  II      60755      224         \n",
       "8  XI      55301      412         \n",
       "9  XII     51486      289         \n",
       "10 X       46692      312         \n",
       "11 CAR     40885       87         \n",
       "12 IX      35505      220         \n",
       "13 Caraga  28181      170         \n",
       "14 VIII    27564      173         \n",
       "15 V       17998       83         \n",
       "16 IVB     17943       92         \n",
       "17 ARMM     6358       63         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "region_total <- dengue_long %>%\n",
    "  group_by(Region) %>%\n",
    "  summarise(\n",
    "    total_cases = sum(Cases, na.rm = TRUE),\n",
    "    total_deaths = sum(Deaths, na.rm = TRUE)\n",
    "  ) %>%\n",
    "  arrange(desc(total_cases))\n",
    "\n",
    "region_total"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "aa51c15d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:50.427602Z",
     "iopub.status.busy": "2025-07-19T00:12:50.425990Z",
     "iopub.status.idle": "2025-07-19T00:12:50.880570Z",
     "shell.execute_reply": "2025-07-19T00:12:50.877837Z"
    },
    "papermill": {
     "duration": 0.467597,
     "end_time": "2025-07-19T00:12:50.883852",
     "exception": false,
     "start_time": "2025-07-19T00:12:50.416255",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdeYBN9f/H8fe5+9x7ZzEz1qHsZKeQXaQIpUWSihIVKiVSKoV2qbTxixItSsoS\n6atFKdqUFAmRiqxj9rn7+f1xmcaYGXeWc4dPz8dfzbmf83l/zulz7n05595zNF3XBQAAAKc/\nU0UPAAAAAOWDYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDY\nFU47gcXuTqnT6LLh45dvOlzRo4sSPZi55MUpAy84t1a15BirLT6xSuvOF06c8fohf6iih3ZK\nOHUmyfbXumqa1vW17dEsaqimLtuJu9dkssQmVG7d5aJpc/5n0BTccE8rTdP6fL7XmO4BwHAa\nT54olKZpIlKrXn27dnRJbkbqvoNHgrqumeyDH1v5xvgeFTk+42Xv+fTSzgNW/5EpIvbYpGqJ\nMWn7/0n3BEUktnbPVd9/0DHJUdFjrGAVNUn0UPa69Rst9jPan1MrvGT7a10bDlvbZd62L4Y2\nMKJi9DV12bbk+KvWqRdr1vIWhgK+w3v3pPuCItJk8Iub37yl3OtuuKfVOY/91HvNng+71Sj3\nzgEgGnQUJrxzfsjy5V+YtXfLixOutGqaiAx/d1cFDS0a/DlbOyU4ROTM7jes/Gb70aXBnE2f\nvHVp80QRia97vSdUoUM8BVTUJPFl/SAicWfcn7dk27wuItJl3jYjylWIJk6riLxxILvA8lAg\n/Z2pA8J7/uEdaeVe99CGZfPmzVu9L6fcewaA6OBSbAm4qp91y+Nvr3/hUhGZf13f/epekXzt\nsl5fpXlq9n5o6ydz+7Srf3SpKaZ5j6sWfbexW7w9feerI7lcVZj/ziSpEJo5buB974+u4RaR\nhS9uK/f+k9r0Hzp06PlVY8q9ZwCIDoJdiZ19yzvXVnX5c7bc8r+/y9BNKNsTKLcxlStP6vJb\nPvrbbKu+/N17HCdMELO91tO3NxGRVeNWV8DgThPlNElOLSGfJ1iOX9zQvQdKm3oHdqkqImmb\n0spvNOXl1D2uAfxHEOxKwXz3Pc1EZP20b/Mv3f3lm8MGdE+pUsnuTGjQvO2oh2btyDnuLT78\nDffh2498v2BSs5oJ7hirxe6q06LLfbMLJKTghy/c07VZnVi7o0qts4bdPSc3JE1dttjqI/Ja\nrL+liaZpl/963Df09WC6pmmuygNLNKoTbZ871a/rKT1faOWyFtqg2YS5S5YsmTvtrPyl33zq\nrp7tmiTFuyy2mMq1GvYZcttHW9Pzr5X6y4rbBveuXz3JbrXFJ9Xs0u/6hd/sO7Hzkw44wn7y\nrBxQR9O0cx79qcDyPZ9cqWlaYqOHStftyZRyksjJdubCs5Jt7jYikvHnVE3Tkhq9mn/dzN9X\n33hp16pJcVaHq3bzTve++FH+V0uxjbemxFpj6vkzN99xSYd4p8tqtlSqWuvCwWM+2Z5RoOVJ\nN23r7E6apo35PS1r98qrujRx25wLDuQUX70oIW9IRNz13CUaQCRH1saHzj7hxxOhz19/9OKu\nLSonuG2u+DrNOo6a/PJebzDv5YiPawCIioq+FnyKCu+cAl+fypO2c4KIxCQPyFuy/unrzJqm\naVrV2k06tW+Z7LKIiCulxyf7//2yTviLUD2nD9M0zVW9fs/+l3RuUztcqN+zP+c1e+G6ZiKi\nmRwNW3doXCtRRFK6j6plt7ir3ZjXZt3NZ4nIZVsO5R9VKJAmIs7kK0o0qhPNbJgoIhd9/FeE\n+yoUyBjRroqImCwJLc/p0K1j29qV7CJitlVfdvBooYMbZiRYTCKSWLdp526dm9SOFxGT2T1z\nS2r+rk464Aj7yS9160QRcVUbXmD5i60ri8jlK/8sXbe6MZPkpDtz44wpE8ZdLyL2uE4TJ06c\n8tT3+rGp1ezu+1PsZneNBuf3v6RLmzOOTa1fSr3rdF0fU8NttlW/rmGCiFiclVu2buy2mETE\nbKvy3LcHSrRpv87qKCI3/vBRqzhbTNWG51/Uf+nh3KLqFvUdO13XdT1wVRWniAxd+0+JBhDJ\nkfXjg21EpPeaPXlLnr22pYhomla1bvOuHc6pZDWLSHz9izdn+8MNIjyuASA6CHaFK/4zO/fw\nUhGxOOqG/0zf+aLdpNnczf/v4x3hJUH/oZfGnCsi8fVHBo+tFf4AEJFOd87PPbb0i5kXi0hM\nUv/wn399OFJE4usN2njYc3StlY/Hmk0iUtJgF+GoTnRlZaeITN2dEcF+0nVd3/PZQBGJPeOK\nrameYyPJnH19QxFpfte34SV3nRknIte+vO7YSsHlk9qLSJU2c/L6iWTAkfRTUMjbxm0TkQ9T\n/40RgdzfY80msz1lvy9Yym6NmSSR7MyifjwhIh3Hve499qOWb+denX8+lG4bx9Rwi4immYY9\nszLcc9B76KUxHUXEHt851R+KfNPCwa5KHXePe97MCZ7kpzeFB7ugb+/27x+54RwRqXLu2Lwt\njWQAER5ZBYLdrsXXiIg9vu3STUePNV/mtju7VxeRM/u9VmDnF3NcA0DUEOwKV/xntjdjvYho\nppjwn692ri4io9bsPa5RyH9tVZeIzPonK7wg/AHgTL7Ml/9DLeRJtJrM9hrhv8aeESciL+46\nLlT978ZGpQh2EY7qROfE2kRkzr5CT5YUYseCsQMGDLjn4z35F6btvEtEzui9OvxngxiriGzP\n9ec18GX9+OCDDz4yfUnekkgGHEk/J/r0uoYi0uG5zXlLdn9wsYjUvnhp5MM7kRGTJJKdWVSw\ni0m6xHvc1PLGW0yWmLpl2cZwsKvV+5XjFwfH1I0XkUGf/B35poWDnbPyoGL+UZEnHOyK0vHm\n6Qf9/3YTyQAiPLIKBLsba7hF5I6v9uVfy5/zaw27WTM5Nmb59MiOawCIGoJd4U52MmZ5vpMx\nwToOi9mafOLtP74e01REui08ehYh/AFw1s3rCjRr4rSabdV1XQ94dls1zR7XqUCDtF33ljzY\nRTqqEw1IjhGRaX9GesbuRJ7U3XPGNsufRSbUSxCR2n1Gr1i32Vv4yZqIBhxBP4VI/+MxEYmt\ndWfekulNk0Tkkd/TIh5eIYyYJCc6cWcWFewaj/yqwLp1HZa8U4al28ZwsLtta8HLtX8s6yUi\nZ/ZdHfmmhYNd4xsLDrJQ4WBXtU69+vnVq5MUYxERe0KT577MC1snH0DkR1b+YBfI3WnWNEtM\nPf8JPb95TlURuXbjQT2C4xoAoslSzD+LURRfxjoRsbpbiEjQs2uXJyByyGHSCm2cseW4r5kn\nNE8oqltv+ud+XY+r1LPAckdCT5FHSjTCko4qv3ax9iWHctdvy5BasUW1efG5mf6Q3mPE6OZO\ni4gEcv544+UFn3/z4/YdO//Y/cffB9ILtL//k/kbel33yYcv9P3wBau7Suu27Tt3O2/AoKFd\nGieWaMAn7adQcWeO757w4Od/P/tVxqOd4myBnC33/5oak9RvYt34CIdXCqWeJCfdmUVJOiep\nmFfLso0XV3UWWJLY6jyR1Rm/bQ166pRoplU6u9JJy+WZ8c2mqysfV1oP5bz/yMDL719510WX\nj0r/0hTZvvWe90spjixf5tdBXXdX6mM5oeMGParK9/t3b06TlsnhJcUc1wAQTQS70vh7xWci\nEl//GhHRdb+IWBy17xp7VaGNq7WvnP9PzVz4x4+I6CGPiGhSsIGmmSMalv7vzSNKOqr8Lry6\n9r0Pb9z05HrpeUWhDTxHVo6+7XZN07bdNEZEDv8wp123UTuz/MkNzu5+bruu/QbXb9ikWd01\n7drPyFvFfWb/j3/b/93/Fi9bufqLL9d998UH3362/OmHJvSf+O7SRy6JfMAn7acIpkevrdfh\nuc2T3t+9ZmiDP1femRvS245/OG9Hl7bb4pRukkSyM4vcSFtxP3IvyzaeGJk0k01E9JCvpDPN\nElOm9xzN5LzsvmXnPOH8PuOr9w7lXpEcE8kASntkFXlzl/BRHPKFCiwBgIpX0acMT1HhnVPE\nVbbg8OpuEbn0g926rushX2Wr2WyrctKrW+FLNh1n/Vpged4lG1/mDyJij+9SoEH67skSwaVY\nb8Y3kncpNuJRnShr7xxN08zW5G8yvIU2+HV2NxFxVb0u/Oegqi4RuePN744b865Jku/qYQGB\nnP0fzX+4stWsadobB3JKPeBC+ilyo2aLSEK9ybquT2lQSTNZ16YXvnWRd2vEJIlkZ0b+5In8\nl2JLt43hS7F3/FbwUuxf/+srIindVkS+aeFLsRE+HqPYX8XqD50ZLyKTd6frekT7NvIj6/hL\nsTvMmmaJqR84ocN3OlQTkSu/269HcFwDQDRxH7sS2zRn8Nx/sqzOJrMuqCkiolnvbpQQ9B2Y\n9M2B4xuGxrSsV7169aWHPRH2bHW3viLZ6U1f+/JfmfmXb3jsnULbZ+8/ruc9/8t3UakMo3JV\nH/5EuypB/6FLLrov44Q70gZytw69a72InDPpbhHRg+nvHMix2M+YMfic/M0ytm3J+++cA683\naNCgxbl35i0xx1S54Np7ZzaopOv66iOeCAccUT9FbtTIS5Nj0nc9+t2+9VN/T0s8a1rnOFsJ\nhldCpZskkezM0injNr437oPjF+jP3bZORNqMa1qO8z9ylSwmEfnLExSJaN+W9MgKMzvqXVfV\nGcjdcffX+/MvD+Ruu/OHQ5rJNq5RCS4rA0CUVGyuPGWFd06BkzGeg9vn3n+NzaSJyI35HgN6\n4LtJImJzt3jrm6O/ywsFMuaP6y4ilRreltcskn/Z//72EBFJaHTtlvSjpX9fPSPeYhYRd/WR\neatseaGDiCQ0vHGf7+hvA1M3v9/UZZV8v4qNcFSF8qatb+6yikjV9oPeXbv52BmLwE+fvHlB\n3TgRcVXrfejozxKDdWMsmqbN/eXfkzrfLnqqkdMqIindPtR1Pejbn2w1a5r5/iX/3tbr4C/L\nG8ZYNc3yaZonwgFH2E9RfnigtYg0uKqeiFz96b8/Oy11twZMkpPvTP3YGbvYlNvz2pz0jF2p\nt/HY7U7MI1/8ODwNQv60uePOExGbu3V4+kU408rxjN2sBpVEpO/XR+9jF8kAIjyyCvwqdufb\nV4mIPaH9ii1Hwkv8Wb/f1aOGiJxx0dFfCnPGDsAphWBXuPBndu2GjfPUqVnVatJERDPZr37i\nkwLt35/Q6+gqLdr1PK9TvWSHiNjjW6/Md9OQCD8AZg1tISIma2yzdl2b160qIv2mvSQisbXG\n57Xxpn9V22EREUdyk4suHXheu2YxJs3mbtHcZc1/g+JIRlWUI1sWn1vl6BMzbXHJdevXSXQf\nPcUVe2bPj/b+28O6B7qJiMns6nxB/ysH9G7ZsKrJ7B5890QRMduqD7tldE4wtP6hC8LrVqnf\nssf5Pdu2qG/SNBE5f+JHJdqNEfZTqJyDi8LrWhx1Dh//Q8fSdWvEJIlkZwb9h+wmTdOsF15+\n1fAxH+uRXYot3TYe/VXssI4iYotPOadd80p2s4iYrUlP/fu71Ig2rRyD3YddU0Sk8cg1JRpA\nJEfWCTcoDs0Y0jwcbWs2atO1bZPw/Znj61/ya85xNygm2AE4RRDsCicnMFmd1c9ocMmwO5du\nPFjoKj8ue2Fgr3aVK7ktVkfVui2uvv3hzWnHfYsr0g+AkH/5zAm9O7WMtztTGna4/5V1uakr\nRSSh3jP51zqyZfn1/TpWiTuavdy1ury1+cgVyc78wS6SURUj6N234PHxF3VuWTUp3mq2xlWq\n3KrLRXc//dZ+X4E7kQU/ePbuDk3PiLGZ3ZWqdOx7zZJNh3Vdf35ot3iHxZVUKyMQ0nX9qzee\nuLhLm8rxLrPJEptYo+MFV72w5MdS7MYI+ynU8GouEal35aoTXypFt0ZMkgh35uePjTizSrzJ\nYmvY7R094u/YlWIbw8Huhyzf2tkTOjSu5bJZ4pJr9Bx484ebj5R008ox2O18t5eImCzx8/Ll\ntpPv2wiOrBOfPKHrwU9em9a3U7PE2BiLI/aMs869+YHZe7z/HgIEOwCnFE0v7PMJFSV1397c\noF61Rkr+Oyyk7RhXqcGMOpd8snNJjxNXCWQf3rUnp27DWpH9dBYogVtTYp/fm/VDlq91EQ8O\nPl2U4sgCgNMRP544tczr2qxmzZrTdh5367L10z4QkXZ3NC50FYsrqQGpDihWKY4sADgdEexO\nLZc/2VdEZpx/w4oNO3P8wewjf70/89ZLF2y3J3R9vmO1ih4dcLriyALwH8Gl2FONPm9sn+Ez\n/xfK9//FldJuzqpVVzXj3gqINmUuxXJkAfiPINidig5sXvPuis93/pNmi0s86+wuA/p2i+W+\n9qgI69+avyXHP2Do9UkWFc7uc2QBUB7BDgAAQBEq/CscAAAAQrADAABQBsEOAABAEQQ7AAAA\nRRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEVYKnoA6sjKygoGgzabLSYmxrgqubm5Pp/PYrG4\nXC7jqng8Hq/XazKZYmNjjavi9/tzcnJEJD4+3rgqwWAwKytLRGJjY00mo/4lo+t6RkaGiLhc\nLovFwMMqIyND1/WYmBibzWZclfBkttvtDofDuCo5OTl+v99qtTqdTuOqhCez2Wx2u93GVfH5\nfLm5uZqmxcXFGVclEAhkZ2eLSFxcnKYZ9cyMUCiUmZkpIm6322w2G1RFRNLT00XE6XRarQY+\nsC4zMzMUCjkcDrvdblyV7OzsQCCgxvs/TncEu3ITCAQCgYCh74PhKn6/37j39LBQKOT3+43e\nlnAVQ0vkr2LoQ1Z0XY9CFRHx+/26rhv6ESXHJrOhCVWiNZmDwWB4pxlaJTzNonNgioiu68bV\nypvMoVDI0DeBvCrGlRCRQCAQDAYNzY5ybDIb90/HsPBkNrQEFMClWAAAAEUQ7AAAABRBsAMA\nAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATB\nDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABA\nEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBGarusVPYZTSCgUOnLkSOnWzduTmqaV34gKr2Jo\niWgWikKV6Px/EYX2WNQKRfOQMbqKKLTHolZIpUPmdNljiYmJUXj3QMWyVPQATi0mkykuLq50\n62ZlZQWDQZvNFhMTU76jyi8nJ8fv91ssFqfTaVwVr9fr8XhMJlNsbKxxVfx+f05OjoiUep9H\nIhAIZGdni4jb7TaZjDpFHQqFMjMzRcTpdFosBh5WGRkZuq47HA6bzWZclfBkttvtDofDuCrZ\n2dmBQMBisbhcLuOqeDwer9drNpvdbrdxVXw+X25urqZphk7mvEMmOpPZ5XIZOpnT09NFJCYm\nxmq1GlclMzMzFArZ7Xa73W5clfBktlqthr4z5+bm+nw+s9lc6kOGVPdfQLArqNRvMeEDxmQy\nGfomFX431zTN0Cp+vz8KVUKhUPg/DK2Sx2KxmM1mgzrP2xaLxRKFzTGbzYZWieZkNrqKz+cT\n4ydzMBgM/4ehVfJOC1mtVuOCXd62MJlPtSper1eMn8w43fEdOwAAAEUQ7AAAABRBsAMAAFAE\n37E7iQunrihR+8V3dDNoJAAAAMXjjB0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2\nAAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACK\nINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEA\nACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKMJS\n0QOAiMiFU1eUqP2i27sYNBIAAHD64owdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCII\ndgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAA\niiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgB\nAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiC\nYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAA\noAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIId\nAACAIgh2AAAAirBEud68W4Y6psy6qnJM+M/96yeNePTn/A1uePWdAUkOkdCahS8u/+KHvzLN\njZu1G3br9XWdeUMt6qVSrAIAAKCOaOYbffvaue/vTRuo63mL0jamxST1v31E07wlZ8ZaRWTn\n4vuefnv3NaPH3FApsGL2C5Pu8L0xe3T47GJRL5ViFQAAAJVEKdgdWP/M3c99eTjLV3D5loyE\nJh07dmx63FLdN+PtX+sNnj7w/HoiUv8JbeB1T7yxZ9i1Ka4iX6phLfEqKa7obDsAAEB0ROm8\nVULTgZOmPDb98bsLLN+Y4a3UOiGYm7HvQFreeTxv+hd/eoK9eqWE/7QndG7ttm1Ys6+Yl0qx\niqHbCwAAEH1ROmNni0upHydBn6PA8h+z/PqXM698bqtf1y2uyhdefftN/Vv4sjeJSBOnNa/Z\nWU7Lqk3pMkSKesnXvcSryJBCxhkKhY4cOVKWLfV4PF6vtyw9RMLv9x8+fNjoKsFgMApVRMTQ\nKvqxS/9paWnGVcmTkZFhaP/hzcnOzs7Ozja0kIjk5uZ6PB7j+g9vi8/ni8IECAQCUZjMuq5H\nZzKX8W0qQunp6ZqmGV0lKysrKyvLuP7DOy03Nzc3N9foKl6v1+creGGq3KuUZTInJiZG4f8p\nKlZF/oYg6NuTZbbWTu74+BtTEvTMb1a+8uTL99kbzL/Uli0iSZZ/zyYmW82BLI+IhLyFv1TU\n8mJWKWpUer6vAJZO2Xs4FUpEsxBVTs0qUStElVOzSnQKscdOwRI4rVVksDPbUt55551jf9m7\nDJqwbdWGT+f8cvnYGBE5Egi5zebwa4f9QXOCTURMtsJfKmp5MasUOiRN01yuMn33zmKx2O32\nsvQQCbPZ7HAUPP1Zjvx+v8/nM5lMMTExxlUJBALhs5tl3OfFCwaD4dNOMTExJpNR3z3QdT0n\nJ0dEHA6H+dhMM0JOTo6u63a73WIx8ODNzc0NhUJWq9VmK/xIKRcejycYDBo9mX0+n9/vj85k\n1jTN6XQaVyVvMjudTuPOu4RCofDJLaMnc/isc3Qms81ms1qtJ29dWuHJbPT7v9frDQQCRh8y\nON2dWnf9aF015uPUg1ZXc5EvfssN1LIffU/ZnhuI75wgIkW9VIpVCh2ApmllfPe3WCyGfn6E\nmc1mQ6vouu7z+cq+N4rn9XrDwc7QKn6/P/xZaOinVCgUCgc7u91u6OdHuIrVajX0nd3r9YZC\nIaMns9/vDwc7Q6uEQqEoBLu872AYWsXn8+VNZuP+lRIMBsPBzujJHA52NpvN0DAU3mNGT2af\nzxeFyRwMBgOBgNGTGae7irzpR9q2F4bfOHqfL3RsQejzvTkJTRo6Es6rYTN/9OWB8FJ/9sZv\nM31tzq8mIkW9VIpVoredAAAAUVGRwS6u7qCknP13Pzj7u19+275548JnJnyRHTvyxoai2e66\novGOeQ9+vOG3f3b+8soDTzmr97yupltEinypFKsAAACopSIvxZosyVNfeOjVWW/MnHafxxxb\nt0GzCU8/2NptFZH6g6aN8j6z8OkHDnu0ei27TZsyIi+BFvVSKVYBAABQSVSDndlWc9myZfmX\n2Cs1vfmeR24+salm7jV0XK+hhfVS1EulWAUAAEAhp9aPJ2CoC6euKFH7hWM6GjQSAABgBK5J\nAgAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAo\ngmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcA\nAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiC\nHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACA\nIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYA\nAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog\n2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAA\nKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAH\nAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAI\ngh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKMJS0QM4tei6npGR\nUZYefD5fenp6eY2nKIFAIApVQqGQoVV0XQ//R3SqZGZmappmdJXs7GzjquQVys3N9Xq9xlUJ\nBoMi4vV6A4GAcVXCnfv9fkMnQHhbgsGgoVVCoZCI6LoehSoikpGREYXJnJWVZTIZ/o//nJwc\nj8djXP/hneb1ev1+v3FVTpfJHBcXZ+gbFE4FBLuCbDZbWVY3mUxl7CESmqYpUCUQCITfDQ2t\nEgwGw1WsVqtxn1K6roerWCwWs9lsUBURCQQCuq5bLBaLxcCDNxgM6rpuNrVVhTsAACAASURB\nVJsN/V8TCoWCwaDRh4zP5wuFQlGYzMFg0OgqwWAw/NFus9mM+3gOhUJ5h4yhkzmctKI2ma1W\nq3FVojOZvV5vFCYzTncEu+NomhYTE1OWHiwWSxl7iITZbI5ClbLvjeJ5vd7waSdDq/j9/vD5\nAIfDYdynVCgUysnJERG73W7o50e4itVqdTgcxlUJf34YPZn9fn8wGDR6ModCIb/fbzKZDK3i\n8XiiMJl9Pl/eZDbuXynBYDA3N1eMn8zZ2dkiYrPZ7Ha7cVXCe8zoyezz+aIwmcP/TDV6MuN0\nx3fsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwA\nAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRB\nsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAA\nUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEO\nAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEAR\nBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAA\nAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDs\nAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMAAFAEwQ4AAEARBDsAAABFEOwAAAAU\nQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUATBDgAAQBEEOwAAAEUQ7AAAABRBsAMA\nAFAEwQ4AAEARBDsAAABFEOwAAAAUQbADAABQBMEOAABAEQQ7AAAARRDsAAAAFEGwAwAAUIQl\nyvXm3TLUMWXWVZVjji0IrVn44vIvfvgr09y4Wbtht15f12kpdnn5rgIAAKCOaJ6x07evnfP+\n3rSAruct2rn4vqffXn/uZSMmj73O/fsnk+6YHSp2efmuAgAAoJIonbg6sP6Zu5/78nCW77il\num/G27/WGzx94Pn1RKT+E9rA6554Y8+wa2tYC1+e4irPVVJc0dl2AACA6IjSGbuEpgMnTXls\n+uN351/oTf/iT0+wV6+U8J/2hM6t3bYNa/YVtbx8VzF+owEAAKIqSmfsbHEp9eMk6HPkX+jL\n3iQiTZzWvCVnOS2rNqX7uhe+XIaU5yoypJBx6rqekZFRli31+Xzp6ell6SESgUAgClVCoZCh\nVfRjF+WjUyUzM1PTNKOrZGdnG1clr1Bubq7X6zWuSjAYFBGv1xsIBIyrEu7c7/cbOgHC2xIM\nBg2tEgqFRETX9ShUEZGMjIwoTOasrCyTyfB//Ofk5Hg8HuP6D+80r9fr9/uNq3K6TOa4uDhD\n36BwKqjI3xCEvNkikmT5940j2WoOZHmKWl6+qxQ6JF3Xy3jwh0KhvDdf40SnStn3RoSiU8XQ\njBLlKsFgMPwWbyiVphmTuRSiM81UqqLS+z9OXxUZ7Ey2GBE5Egi5zebwksP+oDnBVtTy8l2l\n0CFpmma328uyUWaz2WIxfK+aTCar1XrydmWjaZrNVviOKhehUCj8KVjGfR5hFZvNZuhJDp/P\nZ3QVEQmfqLNYLOZj89kIfr8/FAoZPZnDVYyezIFAIBgMGl0lGAyGw5ZKk9lqtRp6xi48mY2u\n4vP5dF03+pAJV1FjMuN0V5HBzupqLvLFb7mBWvajx9v23EB854SilpfvKoUOSdO02NjYMm2U\n1ep2u8vSQyQsFksZxxkJk8lkaJW8iyOGVsm7OOJyuYx7Zw+FQqmpqSISExNj6Htu+PPD4XA4\nHI6Tty6ttLS0UChks9lcLgN/Y5SRkeHz+YyezNnZ2bm5uUZPZo/Hk5WVVfY3kOL5fL7wIeN2\nu40LQ8FgMBzsnE6noZM5HOwcDoehafjIkSPBYNBmszmdTuOqpKen+/1+q9Vq6ATIysoKBoNm\nszkK7/84fVXkDYodCefVsJk/+vJA+E9/9sZvM31tzq9W1PLyXSWaWwoAABAFFfrkCc121xWN\nd8x78OMNv/2z85dXHnjKWb3ndTXdRS4v31UAAADUUsEPYKg/aNoo7zMLn37gsEer17LbtCkj\nTMUuL99VAAAAVBLVYGe21Vy2bNlxizRzr6Hjeg09oWlRy8t3FQAAAIVw6goAAEARBDsAAABF\nEOwAAAAUQbADAABlEgocfmv6+AvObVI5wW2xu6rXa3Hl6Ac3HDTwYXEoCsEOAACUnj/zh8ub\n1rt6/PRfPdUuGXzDiKsvPis5d9GLD3Wo3WLx7qwIOznwzX39+/dfl+EzdKj/BRV8uxMAAHAa\n0/3ju1249Hff3a9//diQ9nmLd3z4cLN+999w3tjLd86JpJucfes/+ODT6/2GP9JXeZyxAwAA\npbR3zS3P/nio/QOf5k91IlK/z6SFvc/I2DX3mT2RnrSrEKFAmmJZkmAHAABK6d3R75ssca9P\naHviS73+b9acOXMahf5d8uuyFwZ0b5Mc77LYYqrXazF0wszUgC4ij9RJqDPgUxG5PNkZV2tC\nuHHW7i/GXnXhGZUT7K7Exq17PDR7Zb6e5J8vXxt0UdeaCc7KNZuOmr7yj6U9NU3b5/+3yf5v\n3hnSp0PlBLfNFd+w7flT5q3Je+nVRkmV6j3tTfv2mu5N3PbErKD+64udNE177rgMGupZKcZd\n/YZy2EfRxaVYAABQOvqjv6e7qt1ez2E+8TVXSu/hw//9868Vo5sNeCmuUbcbb7070RbY8tV7\n85+8ff3eette7zv4tfdqfjJu6JSN972zrHuVRiKSvXdJq7Ou/FNLGXL9iPrJ5p/WLHrw5r5L\n1r3642vDRCR107ONz7szWLXjsJvvth/ZvuDei1c2jctf+uD30xt2vjvXXv/qoaPrxuauXbpg\n8vXnrf19zeqp3cINQoHUoa16H+5y7SMzb4sxaXWvnmoac/7sJzbf+uzR844Zfzz+aZqn80sT\nDNltRiLYAQCA0gh6/tjnCybHd4ik8Wd3v2Oy1/pp48dn2MMpcErlmnGzVs0W6Vunaw/tSKKI\ntO5xfs+kGBGZfsGNf2r1P//zhw5JDhEReWzJuNaXzrj+4cmXTqobf9dF93mdbX/a9lkjp0VE\n7hnZoUrbW/OV0sf0nZxra/TJju+7VHOKSGjaAxPanTXjkd5rx6d3ibOJSOZfD6fN/H71mDZH\n10jocVuKe/brU+TZFeEFX0+cq5nsz1xTrxx2U3RxKRYAAJSGrvtFRLSIssQVX/62f++WY6lO\n9FC2V9f1YM6JLQM5m6duSW18y2vHUp2IyEUPPCsib7+0zZO6/NU9WU3GvhROdSKSfPbo+86I\nzWuZe+i9dw7kNBrxajjViYjJkjzpzWF6yDP5o7+PNtLs829qlb/oyEktclNXzt2XHR7b2OV/\nJjV79Gy3NZJNO6UQ7AAAQGlYYurFWUzetPWFvqoHM1asWLF6zV/hP50JiTk71j499d4brx3U\nq1v7WklJL+4t/HcVntQPg7r+81PttHzsCd1EJP3n9NxD74lIvSvPyL9Kz/aV/139yCoRqXtd\nnfwN3LWuE5F//rcv/KfN3aqK9bgIVHfwVJOmPffsVhE59NOEX3P8FzwzKPJdcergUiwAACgd\n8/gz4ib/+X/bcx9tEFMwUWT+PaNfv4fqXPbpzu61RGTxuJ4Dn/4spXWP/ued269T73FTWu4Z\n2WvMgcJ6NdlEpPmEV57sUaPAK/b4VnrolRPX0Cxavr/0QhpoFhHRA0df0kyuE3o+b2xN96y5\nj8mjiz6+Y6nFfsbMLtWK3O5TGMEOAACU0pDHe9w/8L2rp6377uGuBV5aO+kNEek+oYmI+DK/\nHvT0Z7UumrX7g5F5DV4tok9H4kVmbWwgrdGFF3bMWxjI3bp42U/VWjodWk+Rt3a+95c0Tcp7\n9atvDv27eqULRebueuMPaVMlb2HW3wtEpGrPqsVsy4j7Ws646d3X9+y4c92+mn3eT7Kcllc1\nT8tBAwCAU0Hty+ZfXS9+w2O9bpuzJv+Jsi3vT7n8rd9jki96rm0VEQnkbA3qemKrs/Ma5Pyz\n7qk9mQXOrum6iIjFUf/BJonbFwz9ZN+/38B7a/QlgwcP/tMkzipDL0mO2Tx99M7cQPil1J9f\nvn9nel7LmOTLL6vs3Dp7+PpjzzTTA6mPDpmjmewP9KtVzLbUHfSwWdMm3tT/oD94/VNdSrdD\nKhxn7AAAQClpJtfcb5cdaNX3uRHnLXq2S98ubeIt3m0bPluxfpslpt6cr950mTQRcVa+6vyk\nUZ892W+M9a6zazp3bv56zqxl9ao5fH/9MPONRcMHX2GNtYrI/z03x3tWu6uvaj925YsvNxzS\np16zS6+6+OwGib98+vaC1duaD1twbRWniMz56JHG597VsnGvEUMvsKdtn//ywv7tkpd8c9Bp\nCl+QNb20/P7/dZrUvd7ZQ4dfWsed+/l7r3605UiPSZ/0TLAXsy22+K531IqdvmKrI6HHffUT\norD3jMAZOwAAUHqOxK6rtm+Z/eAt9U1/vzt/1sz/W/DDfseVtzy4btemaxrGH21kciz5cfk1\nPc5c8tzksfdN/3Jb6OXvdy5ZdP8Zsb7xN49OC4SqtH+8X5vaXzx8512PfiQi7jOu3LTpgxsu\nOOOL9+beP/XZ7w4mTn75wx9euSbcWXKbsdt/WHh+vewFT0197aPfblv44+jEGM0cE2c++k27\nKu0nbvt8wWXnut97ZcYD01/e4Wj10KuffTKtx0m35cb7WohIo1seP33jEWfsAABAmZjttUZO\nfnHk5OLauGr1nPdhz+OXjd+VOv7of9paLt+wK/9r8Q0vnPX+hbMK6UnfsOEHW/yF7396Rd6i\nOROyHPHH5bbqna5+639XFzqS6387fH0Rg8zclalp2kPjmhW3Jae2SCNphw4dpv9dyM+S9627\nrUuPa8t1SAAAAEXRRvfo1LnHg3l/B3K2TN6dXrXTqDL2G/IfGv38r7G17rgk3/3zTjsnOWOX\nsWvHP76giHz99dd1f/31t+y441/Xf1nxxbq1fxg1OgAAgOPNuq9b6wkzOg+LualPay3zz4Uz\npuwLxi78v+5l6XPUreNytr/3baZv+Ht3ltMwK8ZJgt3i3u1v2JYa/u83L2j3ZmFt4mqPLu9R\nAQAAFK7V+I8+sI+fNuedW995ImBPbNXx4oWvTR947DkTpfP52/+3KxB/7f2L5pyfUl7jrBAn\nCXYdp8yYleYRkZtvvrnb1KcHV44p0MBkje1w+RWFrQoAAGCIvrc92fe2J8uxw80HMsuxtwp0\nkmDXaNDQRiIisnDhwgE33HhTDXcUxgQAAIBSiPRXsZ999pmh4wAAAEAZlex2J6l/7zyY7T9x\neaNGjcppPAAAACilSIOd59DHl3cetPK31EJf1fVCHrgLAACAaIo02P3fJdd+uD2z3y0Te7eo\nbdEMHRJObxdOXVGi9m/c0t6gkQAA8F8TabCb9t3BuoPeW/7ixYaOBgAAAKUW0ZMn9GDmQX/w\nzEEtjB4NAAAASi2iM3aa2d09wbFz3vdySW2DxwMAAE4bJf36TSQ+ur9vuff53xHhs2K1hR9M\n9X14zbCpr+3PDhg7IgAAAJRKpN+xu2Li0qrVra89MGz+5OGJ1arFmI/7AcVff/1lwNgAAABQ\nApEGu+Tk5OTk889sZehgAAAAUHqRBrv333/f0HEAAACgjCINdunp6cW8Gh8fXx6DAQAAQOlF\nGuwSEhKKeZUnTwAAAFS4SIPdgw8+eNzfemDvzi1L3l6aqqU8+NIj5T4sAAAAlFSkwW7y5Mkn\nLnzmyW96Nuz2zLMbJl0/pFxHBQAAUIgjO7Yedp1Zv3pM2ZslWs2Xbjk0t0Glch1gBYvwPnaF\ni6na/uUprQ799PTn6d7yGhAAAEBRFvbpePGUjeXVTD1lCnYi4qzp1DRzI6e1XEYDAACAUitT\nsAv5Dz59/0aru3U1a1kDIgAAQPFuTYkdtePIr7M6uioPFJFAzm8Tr70wJdFtc8W36j7w7Z9S\nC22We2DdLZd2rZbgttiddZp1eWTR1sgr+rM2T7i6T8OUBGdC1Z5X3fVzlj+8vKg+/1g1q2/b\nJokue3JK3UtufiwjePTXpSHf3kdHX9GyQU2HO6l5t4Hz1u0rvn2pRfoduw4dOpywLPTP9k27\nD3vOue/5Mg4CKKmSPp3wjVvaGzQSAEDUPLVjf93mKbO7L/5hZieR0OizO7yVe/YLry5tlOB9\n7+k7r2nfssaB37vE2Y5vJhM79V2cOOjVZU+mxAQ+f3PCnYPbDe5/pI7DfPJ6um9E604fuC96\n+dUV1SwHZo6+oXt7Obx5elF9pvjWteg3uss9s1bOOifnz/XXDb7tosb9vxzbVEQmdWszO7PL\nc88uOCvJtP7954d3rR/4dc91VTcV1b7UIg12hTHVat5jQM9rnpjERyYAADCcLcbp0DSTNcbp\ntGfsmvx/W4+89veSa1NcItK2c5cvEivf9sQvP05rk7+ZiNQeec/cYbf2rRwjIo3r3Tv2mX4/\nZvvqOE7y8wsRSf11/PydvjWp87rG20SkxSeH+g158x9fqLrNVGifSZmrMoOhm0YNObe6U85u\n/fHi6tudSSKStefpx785+Fnq690S7CLSpn03/9KkKaPWXvny+kLbl0WkwW79+vVlrAQAAFBe\nDny1xupsfF2KK/ynZo4dVz/+psWbZVqbAi3H3nnLZ8sWP/HLb3/8sXPjlyW44PP3snWOSheE\nU52IuGqM+OyzEcX06a55xzVtX72sdp1ufS7o3KlTrz4D+jerJiJpW1fpeqh7JUf+zhN8vxXV\nviz4bhwAADj96LououVfYjZruh4s0Czo/atfg5qDpryVbk7q0u+amYveiLxEyBvSTI4TlxfV\np8mSvODbv3/+9NWL29b89dP5vVrV7DNxtYhY42NMloTMrOPs+eW2otqXRckuxebs2fju0tVb\ndu7NCVqq1216wYArzq7lLuMIAAAASqpK567+nIff+Cd7SHWXiOjBrBnb0mqObFag2ZGt4z7c\n7fnHs7yq1SQiOQdKEOxS+rXwTF38fZb/HLdVRHL2L6jXasKrW/4458/C+9z/1YxH3/c9M33i\nWZ0uul1ky6yOrcdPkMd+jK87Qg8um73XP65B+Dle+l3nd9k3aO5TTVYU2r4su6UEwW7xA1cN\nefgdb+jf32tMGnvzwElvvD3l8rKMAAAAIEJmTbJ2bdu3r0G1Og8Nb/jCqM4Dzc9PbBTve/ep\n29Z7qnw8qXmBZq6ktnpo0fSFa8acV2fP5i8eGzdJRLb8fuCSpDNPWiu51XP9qy7qe/7IuY/e\nUsN2eOaoOzzuy3tXsmdmF95ntyqZzz71YGpCtVF9z9bSf3/+hd/iG40TEUdi36d7pdzT+WL3\nzHs6NKy0eu5dz361Z+Wi2vZDhbcvi0iD3a5FQ66Y+nat84ZPv3dk55b1nZp3x8/rZk+7c87U\nK2ytdi24rHYZxwEAAHBSXe+4JOeuEY3aX5W+e/5LG75KvOn2Owb3PuQ1n9Wu9+vfzO4Wbz+x\n2aon/rjt3kHPZ1hatuv54OLN1a5t/lDnZn1SU09aSzO73/7507tG3Hv71b0OBuPPPv/GNS9N\nEZHYmuOL6vPDpw7d/fzdXR9Mja9a6+weN655aXy4q1s/2JBz28hHRl25z2tv3Pq8BV8s6VXJ\nLpUmF9W+1DRdj+iOKaNTYudrV+z/8xWn6d/r2Xoo58Yzq70TGpq557kyjuOUVdLbaiy+o5vb\nXeLL0yWtsuj2LnFxcUZXWTimY6VKJX7QSiluRJKcnByFKpUqVTKbI/hxe6mEQqHU1FQRiY+P\nt1oNvF/34cOHdV13u90ORyFf+ygvaWlpgUAgJibG5XIZVyUjI8Pn89lstlJM5shlZ2fn5uZa\nLJaEhATjqng8nqysLE3TkpLK+ou2Yvh8voyMDBFJTEw0mYz6hnQwGDxy5IgYP5kPHTokIrGx\nsXa73bgqR44cCQaDTqfT6XQaVyU9Pd3v99vt9tjYWOOqZGVleTweq9UaHx9vXJWSKum7cSQ+\nur9vuff53xHpW8PCgzkNR96eP9WJiGZy3j6mUe7BtwwYGAAAAEom0kuxbpPJs99z4nLPfo9m\n5vcTAADgtJS2Y2L/678q9CVX1aGr3r0xyuMpo0iD3dgG8RPnj/p+2vpzKv17ztyX/sOYOdvi\n6z9mzNgAAACMlVD/sbVrK3oQ5SfSYHf9u1MmN721U+2WN4y5vlOL+g7J/f3ndfOef2Vbjm3m\nousNHSIAAAAiEWmwS2g0astqyzWj7p31yMRZxxYmNur6wgsLbm5s4FeSAQAAEKES3Meu5nkj\n1/w64u+tGzb/vtcr9hp1m7Q5qxZPrgAAADhFRBTMtn+z+sO/skRERKvZ+JxOrXe9v2L1pq07\nc0MR3SoFAAAAUXCSM3YZ25dfd+VNSzf+02vVn32OPT3Mn71p3kuvzHvpqTvqdp2zdMnAZiW+\n1RkAAFAA95w71RR3xs6X8VXblpcv25Q64KZJ41r8e9fNhLpPb/xy5QM3X+L5Y+2Qdueuy/AZ\nP04AAACcRHFn7D67edh2T+D+VbseuuC456lp5riWnfq07NRnWN/x9S5+6vrbvvxtXg+DxwkA\nAE45y+vVK/c++//+e7n3+d9R3Bm7p1b97a4xtkCqy69OvyfvrBX71wfPGDAwAAAAlExxwW59\nhq/yuRcXv/7Fnap40xW6rx8AAMBpq7hgl2gx6Sf73WswN6iZYsp1SAAAACiN4oLdZckxB9a/\nUezq+qyv9jsS+5TvmAAAAFAKxQW7ERNaZ++be9Oi7UU12PTK1e8czGly860GDAwAAAAlU1yw\na3zL4svrxM0Z3OqGqfP/yvLnf8mf+cfc+4e0HfG2q1rvxRObGzxIAAAAnFxxtzsxWZPf/HHN\nzRf1ffWBoa9NubXpOWfXr1nFrvkP/L39++82ZwRCic2uWP7J/Fp2c9SGCwAAgKKc5JFitvjW\nr3y5+4u3n7m8Z9N/Nq59/923Fy56b833f9Tr1G/qnJV//vROxyr8cgIAAETJkR1bd/yTWy7N\nEq3m4duPlKj6A2fGn/3QxhKtUuiQatgtQ35LLV0/xYvgWbGatcuVt7+zat3BXG/WkYP7D6f7\nfBk/rFl63/A+LpNmxJgAAAAKtbBPx4unnDxaRdgsmqIzpJM8K/Z4JldCssuokQAAAKBMIjhj\nBwAAcAq4NSV21I4jv87q6Ko8UEQCOb9NvPbClES3zRXfqvvAt39KLbRZ7oF1t1zatVqC22J3\n1mnW5ZFFWyOvmP33xzf07Vor0VmpWqORjy3Jf3ffkG/vo6OvaNmgpsOd1LzbwHnr9oWXF1qu\nwJBEJOj7Z+JlnRJctsQadW946L28bv9YNatv2yaJLntySt1Lbn4sI3iSOwoXQLADAACnh6d2\n7J9RL6HR8E8O7n5dJDT67A4vrg099urSL1e+1Tvh52vat1yb4TuhmUzs1Hfx3iZzl33y/Zer\nx/YK3T+43S5PMJJyId+eC5v3X/p3tenzV7z/8uR9c4c9uycr79VJ3do8+bk24dkF6z557+YO\nMrxr/Tnb04sqV2BIIrLq4l7Sd+LXm36eM77zqw9e/shfmSLiy1jbot9o6X3Hyi++fuf5uzbM\nu++i57aUaBeV6FIsAABAhbHFOB2aZrLGOJ32jF2T/2/rkdf+XnJtiktE2nbu8kVi5due+OXH\naW3yNxOR2iPvmTvs1r6VY0Skcb17xz7T78dsXx3HyX/9+deqkV9nu7/56o2z3VYRObdjbFyV\nS8IvZe15+vFvDn6W+nq3BLuItGnfzb80acqotTeu7ld4uaTjhiQi1XrOf2z4+SLS+I75je5b\nuG5vjtSK9aSuygyGbho15NzqTjm79ceLq293JpVoFxHsAADA6efAV2uszsbXpRz98r9mjh1X\nP/6mxZtlWpsCLcfeectnyxY/8ctvf/yxc+OXKyIvsXvhNle1G8OpTkQcSf17V3LsERGRtK2r\ndD3UvZIjf/sE328i/SIs1+imf28DnGw5egXVXfOOa9q+elntOt36XNC5U6defQb0b1Yt8gEL\nl2IBAMDpSNd1kePuzmE2a7pe8Bpr0PtXvwY1B015K92c1KXfNTMXFf+s1ONoZq1AiSrWo8HJ\nGh9jsiRkZh1nzy+3RV7OHWc9caHJkrzg279//vTVi9vW/PXT+b1a1ewzcXXkAxbO2AEAgNNR\nlc5d/TkPv/FP9pDqLhHRg1kztqXVHNmsQLMjW8d9uNvzj2d5VatJRHIOlCDYnXlVo+x35v6U\n/VBLl1VE/Fk/LD6UW1dEROLrjtCDy2bv9Y9rkCAiIvpd53fZN2juM+3uL3U5Edn/1YxH3/c9\nM33iWZ0uul1ky6yOrcdPkMd+jLwHztgBAIDThlmTrF3b9u07FF/noeENE0Z1Hrjwwy9+XPfx\nfVe2W++pMnNS8wLN7Elt9ZBv+sI1u//ete6j167qcbeIbPn9QCS/nqjZa1a7mPTzuw5d/NGX\n61a/f333CxNdR8+IORL7Pt0r5f7OF89++8NNP3791Jguz361Z+gVtYsplzekYiraq2Q++9Q9\n102b9/WPP3+zZsmjL/wW32hgifYPwQ4AAJw2ut5xSc7aEY3a3ylifmnDVzed679jcO92PS9d\nfqjp699s7BZvL9Astub4VU+MWnbvoMZNO945ffWoxZtHtK31UOdmG7P8J61lsqX8b9PS3olb\nrx/Qo/fV45zXLHqxdeW8V2/9YMP9lyU+MurKtl36zf+p+oIvvutVyV5MuXwjL1JCg8kfPjXm\np1fu7tq2Tb8hdx5sdeOaNeNLtH80XS/Z/VH+ay6cWoJvWYrI4ju6wZ1xRgAAIABJREFUud1u\no6ssur1LXFyc0VUWjulYqVIlo6u8cUv75OTkKFSpVKmS2WzUc41DoVBqaqqIxMfHW62FfG2i\nvBw+fFjXdbfb7XA4Tt66tNLS0gKBQExMjMtl4C3JMzIyfD6fzWYrxWSOXHZ2dm5ursViSUhI\nMK6Kx+PJysrSNC0pqWS/XysRn8+XkZEhIomJiSaTUf8sDwaDR44cEeMn86FDh0QkNjbWbrcb\nV+XIkSPBYNDpdDqdTuOqpKen+/1+u90eGxtrXJWsrCyPx2O1WuPj442rUlLL69Ur9z77//57\nuff538EZOwAAAEXw4wmgSCU9LygiH0y8wIiRAAAMkrZjYv/rvyr0JVfVoavevTHK4ykjgh0A\nAPjvSqj/2Nq1FT2I8sOlWAAAAEUQ7AAAABRBsAMAAFAEwQ4AAEAR/HgCAACUEvecO9UQ7I6j\n63pOTk5ZevD7/dnZ2eU1nqIEg8EoVAmFQlGoIiLRqZKTk2PcPV3zeDwen89ndBWv1xsMRvI4\nnFIKhUJi/GQOb0IgEDC0it/vF+Mnc3hbdF2PQhURycnJ0TSt+MallnfX+qhN5kAgYFz/4c1R\nYzKHd1RZ3v+dTqdxMwenCIJdQeGPtIrt4aR0XY9CFYnKtkStSnR2mtFVwp9SKm2LGDwBolMl\nr/OobUsUgp0aB2Z0DploVpFo/a/BaYpgdxxN08r4QBir1VqKR4qVlMViMfTBNWEmkykKVUQk\nOlVcLpdxjxTLExMTY+hTmHw+n67rDofD6EeKhUIhm80WhUeKGT2Zw48UM3oy5z1SzNAqPp8v\nfALS7XYb+kix8Ik6p9Np6GT2er0i4nA4ovBIMZvNFoVHilmtVqMfKRYMBs1mc3TeM3Ga4scT\nAAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACK\nINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEA\nACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJg\nBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0AAIAiCHYAAACKINgBAAAogmAHAACg\nCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAiCHQAAgCIIdgAAAIog2AEAACiCYAcAAKAIgh0A\nAIAiCHYAAACKINgBAAAogmAHAACgCIIdAACAIgh2AAAAiiDYAQAAKIJgBwAAoAhLRQ8A+K+7\ncOqKkq6ydHxPI0YCADjdccYOAPD/7d13YFNV/8fxk9G0TUdaStlQKKvsVfaGYgFFhgwVFRc+\nCog4HpQfU0Af5UEERR8VRBCQtkCZZZUlKIhSlmwUka0FSnea+fsjUhFaaJPctD19v/5rcnO/\n5yQ3t597z825ACRBsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEgQ7AAAA\nSRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJEOwA\nAAAkQbADAACQBMEOAABAEtqibgAAT4iellDYl8S/1kWBhgAAFMQZOwAAAEkQ7AAAACRBsAMA\nAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAAkATB\nDgAAQBIEOwAAAEkQ7AAAACShLdryf+wdP/w/P9/+yLNfxfUL8RHCtjPm03W7DlxI10Q0bPX0\ny8+E63Obmt9TTrwEgJtFT0so1PLLX+moUEsAoBQq4nxz89BN35A+rwxvkPtIWICXEOLsygkf\nxv7+xMhRzwZbEj7/ZPyrpqWfj3ScXczvKSdeAgAAIJMiDnZ/Hk8Lqt+uXbsG/3jUbpoVe6Lm\nYzMHRdUUQtSaoRr01Iyll55+srJfvk9V8ir0Syr7FUGHAQAAFFPE560OpeUENwuyZqdd/fOm\n/daDOam7zhutPXpUdvzpHdShmb8uaefVezzlxEs810kAAACPKOIzdgczzPbvPhr88Umz3a71\nC41+/JV/9WlsyjwihKiv98pdrJ5eu+lIqhgq8nvK1KXQLxFD82iP3W7PyspypUdmszkzM9OV\nNRSE1Wr1QBWbzeaBKkIIz1TJyspSqxU/kjEajSaTSekqOTk5VqtV6Sqe2ZgtFouiVcxms1B+\nY3Z8HHa73QNVhBBZWVkqlUqhKnb7X0fZHtuYLRaLcut3dEfpjdnx0Si9MTveKFf2/3q9Xrkt\nB8VEUQY7q+lShsaretl27y+dGmRP37dhwX/nTfCu/XV/XaYQIkT79//gsl4aS4ZRCGHLyfup\n/B6/x0vybJLdbs/OznapU1ari2soPlVcfzcKyDNVcnJypKliNpsdeUVRFotF0f+4DjabzQMb\ngGeqCE9tzEZj3nsw9/LMxuyB7Cg89ZXxzJ7ZlY1Zr9e7tzEohooy2Gl0lePi4m795d1xyNjT\nm5K2zz/6yBhfIUSKxeav0Tieu262aoJ0Qgi1Lu+n8nv8Hi/Js0kqlUpzazHnqFQqD5wWkqmK\nEMLF97yA1Gq1Bw5VZeqLHJuZzWaz2+1KV7Hb7TabTSi8AXi4itKbmeMsl9JVHBuAZ/oix8aM\nkq54zfrRrLzv1hvJXn6NhNh1KttS1fuvndeZbIuhQ5AQIr+nnHhJng1QqVTBwcGudMHb29vf\n39+VNRSEl5dXYGCg0lXUarWL70YBeaaKwWDwQOry9/f38vK6/3Ku0ev1Pj4+Slfx8fHx81P8\nN0ZKb8yZmZnZ2dkajSYoKO9vvVsYjcaMjAzXdyD3ZjKZ0tLShBAGg0G5f+1WqzUlJUUIERAQ\noOjGfO3aNSGEn5+ft7e3clVSUlKsVquPj4+iJ6tSU1PNZrNOpwsICFCuSkZGhtFo1Gq1BoNB\nuSoo6Yoy9d88/clzz4+8arLdesD27eWsoPp1fIK6VtJpNn/3p+NRc+ahH9NNzaMqCCHye8qJ\nl3iunwAAAB5RlMEuMHxISNYfb075/Kejp84cOxQze+yuzIAXnq8jVLo3Bkb8snDK1qRTV84e\nXTDpA33F7k9V8RdC5PuUEy8BAACQS1EOxaq1Zad98vZXny39aPoEoyYgvHbDsR9OaebvJYSo\nNWT6iJzZMR9Oum5U1WzSefrU4bkJNL+nnHgJAACATIr4Gjvv4AYvjnv3xbufUGl6DHu9x7C8\nXpPfU068BAAAQCKcugIAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEsXrlmIA\nUBDR0xIKtXzsy+0VagkAFCucsQMAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABA\nEgQ7AAAASRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsA\nAABJEOwAAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJKEt6gYAQDEVPS2hUMt/M6KNQi0B\ngALijB0AAIAkCHYAAACSINgBAABIgmAHAAAgCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmC\nHQAAgCQIdgAAAJIg2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHAAAgCYIdAACA\nJAh2AAAAkiDYAQAASEJb1A0AgFItelpCoZZf+lJrhVoCQAKcsQMAAJAEwQ4AAEASBDsAAABJ\nEOwAAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAA\nACRBsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJEGw\nAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJaIu6AQAAxUVPSyjs\nS9a/9YASLQGgKM7YAQAASIIzdgAA93DivODasVFKtAQotThjBwAAIAmCHQAAgCQIdgAAAJIg\n2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIggmK/8Fut5tMJlfWYLVac3Jy3NWe/Nhs\nNg9UsdvtHqgihPBMFZPJpFYrfiRjNpttNpvSVSwWiwfeNDZmJ3hsY1apVEpX8djGrOj67Xa7\nUH5jdrxRSlexWq3Cta+Mt7e3W1uE4ohgd6esrCxXXm6xWFxcQ0FYrVYPVLHb7R6oIlx+zwso\nOzvbA/8LPfZ/3Ww2K13FbDY7/pEoyjMbs81mk+krk52d7YEqRqPRM18ZFw+n780R7Mxms6IJ\n0vFNUXpjdsRHVzZmnU7ngc8URYtg9w8qlSo4ONiVNXh7e/v7+7urPfnx8vIKDAxUuoparXbx\n3Sggz1QxGAwajUbpKv7+/l5eXkpX0ev1Pj4+Slfx8fHx8/NTuopnNmaNRhMUFKR0Fdd3IAVk\nMBg8cPo5ICDAAxuzn5+foqeRUlJSrFarj4+PXq9XrkpqaqrZbNbpdAEBAcpVycjIMBqNWq3W\nYDAoVwUlHdfYAQAASIJgBwAAIAmCHQAAgCQIdgAAAJIg2AEAAEiCYAcAACAJgh0AAIAkCHYA\nAACSINgBAABIgmAHAAAgCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmCHQAAgCQIdgAAAJIg\n2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHAAAgCYIdAACAJAh2AAAAktAWdQMA\nACiE6GkJhX3Jqte7eqDQijGdnKgCuBdn7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAk\nQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRBsAMA\nAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAAkATB\nDgAAQBIEOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABA\nEgQ7AAAASRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsA\nAABJEOwAAAAkQbADAACQBMEOAABAEtqibgAAAKVX9LSEQi0fN7qDQi2BHDhjBwAAIAmCHQAA\ngCQIdgAAAJIg2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHAAAgCYIdAACAJAh2\nAAAAkiDYAQAASIJgBwAAIAmCHQAAgCQIdgAAAJIg2AEAAEiCYAcAACAJbVE3wDNsO2M+Xbfr\nwIV0TUTDVk+//Ey4vpR0HAAAlCKl4ozd2ZUTPozd22bA8MljnvL/ddv4Vz+3FXWTAAAA3K4U\nnLiym2bFnqj52MxBUTWFELVmqAY9NWPppaefrOzn9lKjFo7esbAQy/f59Ve3twEAAJRa8ge7\nnNRd543Wl3pUdvzpHdShmf/spJ1Xnxxas2gb5rRRC0d/u7AQyxfn+Dhq4ei9Cwv3Eie645kq\nAAAUOfmDnSnziBCivt4r95F6eu2mI6liaB4L2+12k8nksbbl5OQU2yqjFo7+bmHhXvLA8eNO\nFCqsYv6mbVpYiOWdfscsFovS78OohaO3LyzE8s71pbBHKU5X2a18FQfPbJ8mk0mlUildxWw2\n22yKX7disViULiGEsFqtHvhoPFPFZrM5XcXb29u9jUExJH+ws+VkCiFCtH9fTVjWS2PJMOa5\nsN1uT09P91DLhPBMLY/1SKbuFOcqhR3xb7tvnxNVCqs4v2OeqTJq4eg9Cwv3Eic+GidOPzu3\nAYxaOHpbYQo5XaVQxw9OV9npkSqFOn5wukqhDrnvqKLT6TxwSICipbLb7UXdBmWlX5w5dMSu\nT5avquqtcTwS+/yjG4LeWDQz8u6FbTbbjRs3PNtAAAA8ISQkhGAnPfnP2Hn5NRJi16lsS26w\nO5NtMXQIynNhtVpdtmxZ5wrdvHnTYrH4+Pj4+/s72dYCSE9Pz8nJ0el0gYGBylXJysrKysrS\naDTBwcHKVcnJyXGcGnH6PS8Is9mcmpoqhAgODtZoNApVyT0kMBgMXl5e913eadevX7fb7f7+\n/j4+PspVcWzMvr6+fn7u/41RrrS0NJPJpPTGnJmZmZ2drdVqg4Ly/ta7hdFozMjIUKlUISEh\nylUxmUxpaWlCiDJlyqjVSs1pYLVaU1JShPIb87Vr14QQAQEBio4PpqSkWK1WvV6v1+uVq5Ka\nmmo2m729vQMCApSrkpGRYTQavby8DAaDclVQ0sk/3YlPUNdKOs3m7/50/GnOPPRjuql5VIWi\nbRUAAIDbyR/shEr3xsCIXxZO2Zp06srZowsmfaCv2P2pKgqeVAMAACgS8g/FCiFqDZk+Imd2\nzIeTrhtVNZt0nj51eCnIswAAoNQpFcFOqDQ9hr3eY1hRNwMAAEBJnLoCAACQBMEOAABAEgQ7\nAAAASRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJ\nEOwAAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAA\nACRBsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEiq73V7UbZCExWKx2+1q\ntVqj0ShXxWq12mw2lUql1WqVriKE8PLyUq6KzWazWq1KV7Hb7RaLRQih1WpVKlWJriKEMJvN\nQgiNRqNWK3hU5pmN2VHFMxuz0lU8vDFL8JURntqYHVU8szHLsf9HSUewAwAAkARDsQAAAJIg\n2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHQGbG5KQ/zbaiboXbSNYdDzAmJ22+\nmlXUrQA8h2CHPBiTk96bm2BReIpDqlBF6Sp2y/VxL7+bmGJUtoynyNQdz2wAQohV42cueX+j\n4mWUZ0xOmjJxXooH3jKUcAQ7N7BbbuzauOLLr2P3/JJa1G1xj9TTR35K/OKVWWsU3YdQhSpK\nV1Fpg9MstmOn0hSs4cE9gGe64xme2QCEED1ebJ129utNydkKrd+SdX7BzLdfePq518d/cOCy\ngqcG57z+/oHD60a/9RnZDvemmTJlSlG3oWQzXjsw7dVxq3afvHjm0I6N61LKtW0ZbnB/leSk\nN1+afDxVVaVmuMFbwVvWOPhXa9aucvaKmJjvLuuj20ao3X1XIWNy0rb0oCb1WylaxUHpvshU\nxZicdENXoXz15hL05RaVOXHN4RvNHu5cQaECntkD3KJ4dzzGUxuA0FdoeX7Dqh1Hg/pH1Xb7\nyo3JSW+NmPizqXyPLk1Tj3+7cvUPXftF+2kU6UxF077EE7YKmSdW/ZjStVukr3JvGUo4gp1L\njMlJ415+93p4rzmzpz455EHd5T2rViU+OLCvt7u/cnvfHb/+wrWbvx6Kj084l2qrWL1mGb37\n7xVoTE6a+dXBNi3rqFXCEKbgbnf5q6+v/FE3oGd95ap4rC+5Snpf7JbrY4ePNXZ9uLGfV0nv\ny+20V3ZuOiYG9W2mxMo9tgfIpWh3/mY3bV/51fzFK0+m6CIbhLmxM57fAIRKHVHjStyKlVV6\n9Q/zcedu0/Hpp9cbMPfdUZFNmnbp2Wn3yqWXOj7UNtDbjVVyBdVtuiN+ZZ2RI0zb4+J/vEG2\nQ34Ids7761tdf8DciU8ZvNQqtXdEZMtlMbE9Bg0J1Lh5jDu0gWrFugMdx78XVTZrZ8K6tWvW\nnPrDGFq1VrlAnRurXD+0ed7ipbk7WeV2uxUrX1y+ek1wVL9aimUIj/XldiW6Lyq1z/KY2Kxa\nPbqH+YuS3Bfj9Z8PnU33CzT4aNVCCG3QsRXrfhw0uL8SJzg9sAfwWHdy2W1Z8yeOWPb9taYN\nyu9fv3znH4YHWtd2VzUPbADWrCy1l9ftj+grtLywcfXWUxX6dqnhhgJCiNs//QmPO07RqTR+\nJ9etTFeZftq0+eiF9Lr1a7k336s0fvXtPy1aaZ0767E9sV+T7ZAfgp2Tbv9W+9z6amVd3RG/\n8fjVoz9t2fdLuYaNy/u67ejQyz/C+t36rT9Y/m/S6D4PdvAzXd+duGXj+lWHzqeXqRReKdjX\nLVXuHhxR6L/7HYMj7q2S3zhvyc12nvpc7hzmc/vnkuc4r3urWI3nJr80fsXGDatXrNj23U/H\nz/x2PUt75OCxSh171jC452vi4Jk9gMe6c7vTX4+d/3PVOfPf6da+Y91ru+MSt/2YHOSubKf0\nxmxKPTR2+Jh1hy8HlKsWVi7wr0dV6ogaV2KWLa/9UP9KbrqUJfG9CYmXsp4YO65+mb/Oz136\n7otPtp/w8atQzSB2rIvfmJTZ74Hm7t3NBNVttvWbj260e/a1RxqQ7ZAfgp2Tzm36Kmb/+fpR\nj3Zv8Nd/QVPa8bfHzM4KbdSufYOUw1til+8uH9mperBL5+QdGaWWv5cQonq9jLj4daZWDzav\nEBrRvEOE6si2YxnGi8cSN63edzo5oFxYtVB/p6vcY3BEkQxx1+CIG6vcY5y35GY7z/Tl7mE+\nd1W59zivG/ui1gZ179+vW/tWDerWCvJV37h8NumHw1k5lh82rF65bvO+pENnfv39z+upJqtK\nHxCoc+FaKM/sATzWndvNnTE/eMTEfjUCzJknp879dvTUZ/Yu+nz71YCW1YwX1WVCdM4EI4/t\nZDTeoVUr+v1+aPvKFSt2HL6gD6kSXjFICKEvH3lxU3ziubA+Hao6v/bb1OrUMeXg9hXLt5Zr\n1bVGkPeVvUte+e/qjs++O/WFvi1ate/eWMTErszq2Ke5s4MqxuSk8a/PuiL8a9asorv1jqg0\nfvVsP81fcvnRx/p26VyTbIc8EeycVKZ+p9rizLKlS8/rGnSoX96UdnzyyElXqkZ/MvPVyIaN\nO/eKSt2/Zsmy9ZeuX6vapKlB6+S4TG5GEUJ4Bze9lrh654+WRx5qembT3HGLjj41Ze5bz/cs\n42U5vmdHsqFJ50aVnKty38GR2x/p3S7CiV1IQQZHXK/icO9xXndVuTclqijRl4IM87mlL/cd\n53XjO6ZSafyDQqrWqNW4WWSnbj36DhiUtHp5QL/Rw9rWUJvSfztxaPvWrYlbNpzXRHRuVNHp\nKkrvAXKTkEbtie7c7vyWVZeCOvZo6Pu/V18r/9yMfi2aNlL9uGx14tqEHdbwqDbVnDmA9MBO\n5i8qdblqdbv07N+mbrk/TuyJi4tN3H/WO7hSzSplI8KvfrM4tvHD/ct5uTRQ/tfxdmBgZLcu\nN/avXxa3VReQ/N85q9o++5/X+jZwLOMb2mBNXKymee9ulfycq7Jy/Jvbz18+c3LfmrXfZWkC\nwmtXcwzsBtVtlrh0zvVmvSKrhudmu95RkVoV2Q5/Idg5r1KjzrXFmSVLlvwmgjbPmXW5SvTH\n0583OC62UPu0iOpZJufs7wEd+jSt4nSJ2zOKEKJWjSvL1yRcFxe/+PqnJ6d8PKBJiFoXULtR\nywf79+3SuJrTVQoyOOJ45Kyo3anw8bHggyOuVMl133Fet1S5LyWquLcvBR/mc0df7j/Oq9zn\nYtm+9lB2l1f+1a1F6/Y9evcZ9MhD7Vp37du5nourVXQPcEcSUro7dkvK17Pjwlo28VWrIjo0\njIqsfXnd5K8vPfCf5yOFEFe/XZv1wtsv9n704aahhV1zwS+NcO8GEFwxvH33h7o3q37zt6TY\nmJgNe08F1u7tc3TXlqt1HmrtUgLOPd5WqX0d2W7F5sOVek+aPrRJ7jJ/7P1s1e6zw4Y/Uc3Z\nkd96XVqe373zijVs4OC2JzYv+XLZ9nSVX41a1fRe/vWsP32x9MrAPpFav0pdOtdMtlZt10DB\n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\nEOwAAAAk8f8xm/0LfHeBjQAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# bar chart for cases and deaths by region\n",
    "\n",
    "region_long <- region_total %>%\n",
    "  pivot_longer(cols = c(total_cases, total_deaths), \n",
    "               names_to = \"Category\", \n",
    "               values_to = \"Count\")\n",
    "\n",
    "ggplot(region_long, aes(x = reorder(Region, -Count), y = Count, fill = Category)) +\n",
    "  geom_bar(stat = \"identity\", position = \"dodge\") +\n",
    "  labs(title = \"Dengue Cases vs Deaths per Region\", x = \"Region\", y = \"Count\") +\n",
    "  theme_minimal() +\n",
    "  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +\n",
    "  scale_fill_manual(values = c(\"total_cases\" = \"steelblue\", \"total_deaths\" = \"firebrick\"))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "056045aa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:50.904237Z",
     "iopub.status.busy": "2025-07-19T00:12:50.902729Z",
     "iopub.status.idle": "2025-07-19T00:12:51.632997Z",
     "shell.execute_reply": "2025-07-19T00:12:51.629363Z"
    },
    "papermill": {
     "duration": 0.744717,
     "end_time": "2025-07-19T00:12:51.637006",
     "exception": false,
     "start_time": "2025-07-19T00:12:50.892289",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nCYIdAACAJgh2AAAAmiDYAQAAaIJgBwAAoAmCHQAAgCYIdgAAAJog2AEAAGiCYAcAAKAJgh0A\nAIAmCHYAAACaINgBAABogmAHAACgCYIdAACAJgh2AAAAmiDYAQAAaIJgBwAAoAmCHQAAgCYI\ndgAAAJog2AEAAGiCYAcAAKAJgh0AAIAmCHYAAACaINgBAABogmAHAACgCYIdAACAJgh2AAAA\nmiDYAQAAaIJgBwAAoAmCHQAAgCYIdgAAAJog2AEAAGiCYAcAAKAJgh0AAIAmCHYAAACaINgB\nAABogmAHAACgCYIdAACAJgh2AAAAmiDYAQAAaIJgBwAAoAmCHQAAgCYIdgAAAJog2AEAAGiC\nYAcAAKAJgh0AAIAmCHYAAACaINgBAABogmAHAACgCYIdAACAJgh2AAAAmiDYAQAAaIJgBwAA\noAmCHQAAgCYIdgAAAJog2AEAAGiCYAcAAKAJgh0AAIAmCHYAAACaINgBAABogmAHAACgCYId\nAACAJgh2AAAAmiDYAQAAaIJgBwAAoAmCHQAAgCYIdgAAAJog2AEAAGiCYAcAAKAJgh0AAIAm\nCHYAAACaINgBAABogmAHAACgCYIdAACAJgh2AAAAmiDYAQAAaIJgBwAAoAmCHQAAgCYIdgAA\nAJog2AEAAGiCYAcAAKAJgh0AAIAmCHYAAACaINgBAABogmAHAACgCYIdAACAJgh2AAAAmiDY\nAQAAaIJgBwAAoAmCHQAAgCYIdgAAAJog2AEAAGiCYAcAAKAJgh0AAIAmCHYAAACaINgBAABo\ngmAHAACgCYIdAACAJgh2AAAAmvh/2zmG9qFu7vEAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Heatmap by region and year\n",
    "\n",
    "cases_heatmap <- ggplot(dengue_long, aes(x = Year, y = Region, fill = Cases)) +\n",
    "  geom_tile(color = \"white\") +\n",
    "  scale_fill_gradient(low = \"white\", high = \"blue\") +\n",
    "  labs(\n",
    "    title = \"Dengue Cases\",\n",
    "    x = \"Year\", y = \"Region\", fill = \"Cases\"\n",
    "  ) +\n",
    "  theme_minimal() +\n",
    "  coord_fixed()\n",
    "\n",
    "deaths_heatmap <- ggplot(dengue_long, aes(x = Year, y = Region, fill = Deaths)) +\n",
    "  geom_tile(color = \"white\") + \n",
    "  scale_fill_gradient(low = \"white\", high = \"red\") +\n",
    "  labs(\n",
    "    title = \"Dengue Deaths\",\n",
    "    x = \"Year\", y = \"Region\", fill = \"Deaths\"\n",
    "  ) +\n",
    "  theme_minimal() +\n",
    "  coord_fixed()\n",
    "\n",
    "cases_heatmap + deaths_heatmap + plot_layout(ncol = 2)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "641330c5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-18T20:54:43.446262Z",
     "iopub.status.busy": "2025-07-18T20:54:43.444212Z",
     "iopub.status.idle": "2025-07-18T20:54:43.552513Z",
     "shell.execute_reply": "2025-07-18T20:54:43.550621Z"
    },
    "papermill": {
     "duration": 0.010469,
     "end_time": "2025-07-19T00:12:51.657899",
     "exception": false,
     "start_time": "2025-07-19T00:12:51.647430",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Reducing sample size by major island group**\n",
    "\n",
    "Using stratified sampling by major island group (Luzon, Visayas, Mindanao), we ensure geographic representation"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "99fb7f4e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2025-07-19T00:12:51.683953Z",
     "iopub.status.busy": "2025-07-19T00:12:51.681874Z",
     "iopub.status.idle": "2025-07-19T00:12:51.769953Z",
     "shell.execute_reply": "2025-07-19T00:12:51.766890Z"
    },
    "papermill": {
     "duration": 0.105726,
     "end_time": "2025-07-19T00:12:51.773782",
     "exception": false,
     "start_time": "2025-07-19T00:12:51.668056",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 30 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Region</th><th scope=col>Year</th><th scope=col>Cases</th><th scope=col>Deaths</th><th scope=col>IslandGroup</th></tr>\n",
       "\t<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>II    </td><td>2014</td><td> 3854</td><td> 17</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>CAR   </td><td>2014</td><td> 2582</td><td>  7</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>IVB   </td><td>2010</td><td> 2242</td><td> 26</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>CAR   </td><td>2013</td><td> 8718</td><td> 17</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>NCR   </td><td>2010</td><td>23644</td><td>133</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>IVA   </td><td>2009</td><td> 7215</td><td> 42</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>IVB   </td><td>2009</td><td>  171</td><td>  2</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>IVB   </td><td>2013</td><td> 5108</td><td> 14</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>IVA   </td><td>2010</td><td>24851</td><td>106</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>III   </td><td>2012</td><td>28360</td><td> 61</td><td>Luzon   </td></tr>\n",
       "\t<tr><td>X     </td><td>2013</td><td> 5361</td><td> 49</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>XII   </td><td>2008</td><td> 1102</td><td>  6</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>XII   </td><td>2009</td><td> 3242</td><td> 10</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>XII   </td><td>2010</td><td> 9937</td><td> 55</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>IX    </td><td>2012</td><td> 5498</td><td> 42</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>ARMM  </td><td>2012</td><td> 1459</td><td> 14</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>XII   </td><td>2011</td><td> 2735</td><td> 26</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>X     </td><td>2008</td><td> 1073</td><td> 14</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>XII   </td><td>2012</td><td> 4573</td><td> 53</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>Caraga</td><td>2010</td><td> 3126</td><td> 13</td><td>Mindanao</td></tr>\n",
       "\t<tr><td>VI    </td><td>2015</td><td>10353</td><td> 26</td><td>Visayas </td></tr>\n",
       "\t<tr><td>VI    </td><td>2014</td><td> 8489</td><td> 27</td><td>Visayas </td></tr>\n",
       "\t<tr><td>VII   </td><td>2009</td><td> 7070</td><td> 79</td><td>Visayas </td></tr>\n",
       "\t<tr><td>VII   </td><td>2008</td><td> 3424</td><td> 96</td><td>Visayas </td></tr>\n",
       "\t<tr><td>VIII  </td><td>2010</td><td>12022</td><td> 93</td><td>Visayas </td></tr>\n",
       "\t<tr><td>VI    </td><td>2011</td><td> 3206</td><td> 39</td><td>Visayas </td></tr>\n",
       "\t<tr><td>VII   </td><td>2013</td><td>15853</td><td> 57</td><td>Visayas </td></tr>\n",
       "\t<tr><td>VIII  </td><td>2008</td><td>  905</td><td> 11</td><td>Visayas </td></tr>\n",
       "\t<tr><td>VII   </td><td>2010</td><td>15362</td><td>116</td><td>Visayas </td></tr>\n",
       "\t<tr><td>VIII  </td><td>2014</td><td> 5239</td><td> 21</td><td>Visayas </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 30 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Region & Year & Cases & Deaths & IslandGroup\\\\\n",
       " <fct> & <int> & <int> & <int> & <chr>\\\\\n",
       "\\hline\n",
       "\t II     & 2014 &  3854 &  17 & Luzon   \\\\\n",
       "\t CAR    & 2014 &  2582 &   7 & Luzon   \\\\\n",
       "\t IVB    & 2010 &  2242 &  26 & Luzon   \\\\\n",
       "\t CAR    & 2013 &  8718 &  17 & Luzon   \\\\\n",
       "\t NCR    & 2010 & 23644 & 133 & Luzon   \\\\\n",
       "\t IVA    & 2009 &  7215 &  42 & Luzon   \\\\\n",
       "\t IVB    & 2009 &   171 &   2 & Luzon   \\\\\n",
       "\t IVB    & 2013 &  5108 &  14 & Luzon   \\\\\n",
       "\t IVA    & 2010 & 24851 & 106 & Luzon   \\\\\n",
       "\t III    & 2012 & 28360 &  61 & Luzon   \\\\\n",
       "\t X      & 2013 &  5361 &  49 & Mindanao\\\\\n",
       "\t XII    & 2008 &  1102 &   6 & Mindanao\\\\\n",
       "\t XII    & 2009 &  3242 &  10 & Mindanao\\\\\n",
       "\t XII    & 2010 &  9937 &  55 & Mindanao\\\\\n",
       "\t IX     & 2012 &  5498 &  42 & Mindanao\\\\\n",
       "\t ARMM   & 2012 &  1459 &  14 & Mindanao\\\\\n",
       "\t XII    & 2011 &  2735 &  26 & Mindanao\\\\\n",
       "\t X      & 2008 &  1073 &  14 & Mindanao\\\\\n",
       "\t XII    & 2012 &  4573 &  53 & Mindanao\\\\\n",
       "\t Caraga & 2010 &  3126 &  13 & Mindanao\\\\\n",
       "\t VI     & 2015 & 10353 &  26 & Visayas \\\\\n",
       "\t VI     & 2014 &  8489 &  27 & Visayas \\\\\n",
       "\t VII    & 2009 &  7070 &  79 & Visayas \\\\\n",
       "\t VII    & 2008 &  3424 &  96 & Visayas \\\\\n",
       "\t VIII   & 2010 & 12022 &  93 & Visayas \\\\\n",
       "\t VI     & 2011 &  3206 &  39 & Visayas \\\\\n",
       "\t VII    & 2013 & 15853 &  57 & Visayas \\\\\n",
       "\t VIII   & 2008 &   905 &  11 & Visayas \\\\\n",
       "\t VII    & 2010 & 15362 & 116 & Visayas \\\\\n",
       "\t VIII   & 2014 &  5239 &  21 & Visayas \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 30 × 5\n",
       "\n",
       "| Region &lt;fct&gt; | Year &lt;int&gt; | Cases &lt;int&gt; | Deaths &lt;int&gt; | IslandGroup &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| II     | 2014 |  3854 |  17 | Luzon    |\n",
       "| CAR    | 2014 |  2582 |   7 | Luzon    |\n",
       "| IVB    | 2010 |  2242 |  26 | Luzon    |\n",
       "| CAR    | 2013 |  8718 |  17 | Luzon    |\n",
       "| NCR    | 2010 | 23644 | 133 | Luzon    |\n",
       "| IVA    | 2009 |  7215 |  42 | Luzon    |\n",
       "| IVB    | 2009 |   171 |   2 | Luzon    |\n",
       "| IVB    | 2013 |  5108 |  14 | Luzon    |\n",
       "| IVA    | 2010 | 24851 | 106 | Luzon    |\n",
       "| III    | 2012 | 28360 |  61 | Luzon    |\n",
       "| X      | 2013 |  5361 |  49 | Mindanao |\n",
       "| XII    | 2008 |  1102 |   6 | Mindanao |\n",
       "| XII    | 2009 |  3242 |  10 | Mindanao |\n",
       "| XII    | 2010 |  9937 |  55 | Mindanao |\n",
       "| IX     | 2012 |  5498 |  42 | Mindanao |\n",
       "| ARMM   | 2012 |  1459 |  14 | Mindanao |\n",
       "| XII    | 2011 |  2735 |  26 | Mindanao |\n",
       "| X      | 2008 |  1073 |  14 | Mindanao |\n",
       "| XII    | 2012 |  4573 |  53 | Mindanao |\n",
       "| Caraga | 2010 |  3126 |  13 | Mindanao |\n",
       "| VI     | 2015 | 10353 |  26 | Visayas  |\n",
       "| VI     | 2014 |  8489 |  27 | Visayas  |\n",
       "| VII    | 2009 |  7070 |  79 | Visayas  |\n",
       "| VII    | 2008 |  3424 |  96 | Visayas  |\n",
       "| VIII   | 2010 | 12022 |  93 | Visayas  |\n",
       "| VI     | 2011 |  3206 |  39 | Visayas  |\n",
       "| VII    | 2013 | 15853 |  57 | Visayas  |\n",
       "| VIII   | 2008 |   905 |  11 | Visayas  |\n",
       "| VII    | 2010 | 15362 | 116 | Visayas  |\n",
       "| VIII   | 2014 |  5239 |  21 | Visayas  |\n",
       "\n"
      ],
      "text/plain": [
       "   Region Year Cases Deaths IslandGroup\n",
       "1  II     2014  3854  17    Luzon      \n",
       "2  CAR    2014  2582   7    Luzon      \n",
       "3  IVB    2010  2242  26    Luzon      \n",
       "4  CAR    2013  8718  17    Luzon      \n",
       "5  NCR    2010 23644 133    Luzon      \n",
       "6  IVA    2009  7215  42    Luzon      \n",
       "7  IVB    2009   171   2    Luzon      \n",
       "8  IVB    2013  5108  14    Luzon      \n",
       "9  IVA    2010 24851 106    Luzon      \n",
       "10 III    2012 28360  61    Luzon      \n",
       "11 X      2013  5361  49    Mindanao   \n",
       "12 XII    2008  1102   6    Mindanao   \n",
       "13 XII    2009  3242  10    Mindanao   \n",
       "14 XII    2010  9937  55    Mindanao   \n",
       "15 IX     2012  5498  42    Mindanao   \n",
       "16 ARMM   2012  1459  14    Mindanao   \n",
       "17 XII    2011  2735  26    Mindanao   \n",
       "18 X      2008  1073  14    Mindanao   \n",
       "19 XII    2012  4573  53    Mindanao   \n",
       "20 Caraga 2010  3126  13    Mindanao   \n",
       "21 VI     2015 10353  26    Visayas    \n",
       "22 VI     2014  8489  27    Visayas    \n",
       "23 VII    2009  7070  79    Visayas    \n",
       "24 VII    2008  3424  96    Visayas    \n",
       "25 VIII   2010 12022  93    Visayas    \n",
       "26 VI     2011  3206  39    Visayas    \n",
       "27 VII    2013 15853  57    Visayas    \n",
       "28 VIII   2008   905  11    Visayas    \n",
       "29 VII    2010 15362 116    Visayas    \n",
       "30 VIII   2014  5239  21    Visayas    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "island_group <- dengue_long %>%\n",
    "  mutate(\n",
    "    IslandGroup = case_when(\n",
    "      Region %in% c(\"NCR\", \"CAR\", \"I\", \"II\", \"III\", \"IVA\", \"IVB\", \"V\") ~ \"Luzon\",\n",
    "      Region %in% c(\"VI\", \"VII\", \"VIII\") ~ \"Visayas\",\n",
    "      Region %in% c(\"IX\", \"X\", \"XI\", \"XII\", \"Caraga\", \"ARMM\") ~ \"Mindanao\"\n",
    "    )\n",
    "  )\n",
    "\n",
    "# 10 from each island group\n",
    "set.seed(123)\n",
    "reduced_sample <- island_group %>%\n",
    "  group_by(IslandGroup) %>%\n",
    "  sample_n(10)\n",
    "\n",
    "reduced_sample"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 7896821,
     "sourceId": 12511129,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": false,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 8.290531,
   "end_time": "2025-07-19T00:12:51.908678",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2025-07-19T00:12:43.618147",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
