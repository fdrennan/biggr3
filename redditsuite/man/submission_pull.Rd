% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/submission_pull.R
\name{submission_pull}
\alias{submission_pull}
\title{submission_pull}
\usage{
submission_pull(
  con,
  subreddit = NULL,
  limit = 10,
  columns_selected = c("archived", "author", "author_premium", "domain", "fullname",
    "hidden", "id", "is_original_content", "is_self", "name", "num_crossposts",
    "over_18", "permalink", "selftext", "subreddit", "subreddit_id",
    "subreddit_subscribers", "thumbnail", "title", "ups", "upvote_ratio", "url",
    "visited"),
  wide = TRUE,
  to_json = FALSE,
  pretty = FALSE
)
}
\description{
submission_pull
}
