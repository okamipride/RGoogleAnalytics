% Generated by roxygen2 (4.0.1): do not edit by hand
\name{GetReportData}
\alias{GetReportData}
\title{Query the Google Analytics API for the specified dimensions, metrics and other query parameters}
\usage{
GetReportData(query.builder, token, split_daywise = FALSE,
  paginate_query = FALSE, delay = 0)
}
\arguments{
\item{query.builder}{Name of the object created using \code{\link{QueryBuilder}}}

\item{token}{Name of the token object created using \code{\link{Auth}}}

\item{paginate_query}{Pages through chunks of results by requesting maximum
number of allowed rows at a time. Note that
if this argument is set to True, queries will take more longer to complete and use
more Quota. For more on Google Analytics API Quota check
\url{https://developers.google.com/analytics/devguides/reporting/core/v3/limits-quotas#core_reporting}}

\item{split_daywise}{Splits the query by date range into sub queries of
single days. Setting this
argument to True automatically paginates through each daywise query. Note that
if this argument is set to True, queries will take more longer to complete and use
more Quota}

\item{delay}{Since Pagination and Query splitting fire sucessive queries, there is a
possibility of getting Quota Eror: Rate Limit Exceeded from the Google Analytics API.
This parameter can be used to specify a Time delay (in seconds) between successive
queries in order to stay within the Google Analytics API Rate Limits}
}
\value{
dataframe containing the response from the Google Analytics API
}
\description{
This function will retrieve the data by firing the query to the Core Reporting API. It also displays
status messages after the completion of the query. The user also has the option split the query into
daywise partitions and paginate the query responses in order to decrease the effect the sampling
}
\examples{
\dontrun{
# This example assumes that a token object is already created

# Create a list of Query Parameters
query.list <- Init(start.date = "2014-11-28",
                   end.date = "2014-12-04",
                   dimensions = "ga:date",
                   metrics = "ga:sessions,ga:pageviews",
                   max.results = 1000,
                   table.id = "ga:33093633")

# Create the query object
ga.query <- QueryBuilder(query.list)

# Fire the query to the Google Analytics API
ga.df <- GetReportData(query, oauth_token)
ga.df <- GetReportData(query, oauth_token, split_daywise=True)
ga.df <- GetReportData(query, oauth_token, paginate_query=True)
}
}
\seealso{
Prior to executing the query, as a good practice
queries can be tested in the Google Analytics Query Feed Explorer at \url{http://ga-dev-tools.appspot.com/explorer/}
}

