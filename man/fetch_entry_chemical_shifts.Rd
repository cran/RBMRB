% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RBMRB.R
\name{fetch_entry_chemical_shifts}
\alias{fetch_entry_chemical_shifts}
\title{Imports chemical shift table for a given entry or list of entries from BMRB data base}
\usage{
fetch_entry_chemical_shifts(IDlist)
}
\arguments{
\item{IDlist}{sinlge BMRB ID (or) list of BMRB IDs in csv format; For macromolecule entries it is just a number without bmrb prefix (example: c(15060,15000,18867));
For metabolomics entries it should have 'bmse' prefix (example: c('bmse000035','bmse000035','bmse000036'))}
}
\value{
R data frame that contains  Atom_chem_shift data for a given list of entries
}
\description{
Downloads NMR chemical shift data from BMRB database for a given Entry ID or list of Entry IDs
}
\examples{
#df<-fetch_entry_chemical_shifts(15060)
# Downloads NMR chemical shifts of a single entry from BMRB
#df<-fetch_entry_chemical_shifts(c(17074,17076,17077))
# Downloads NMR chemical shifts of multiple entries from BMRB
# df<-fetch_entry_chemical_shifts(c('bmse000034','bmse000035','bmse000036'))
# Downloads data from BMRB metabolomics database
}
\seealso{
\code{\link{fetch_atom_chemical_shifts}},\code{\link{fetch_entry_cs}} and \code{\link{fetch_res_chemical_shifts}}
}
