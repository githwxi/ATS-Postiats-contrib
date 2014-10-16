/* ****** ****** */
//
// API for MPI in ATS
//
/* ****** ****** */
//
// Starting time: October 15, 2014
//
/* ****** ****** */


#ifndef MPI_MPI_CATS
#define MPI_MPI_CATS

/* ****** ****** */

#include <mpi.h>


/* ****** ****** */


#define atscntrb_mpi_MPI_Init MPI_Init

#define atscntrb_mpi_MPI_Finalize MPI_Finalize

#define atscntrb_mpi_MPI_Comm_size MPI_Comm_size

#define atscntrb_mpi_MPI_Comm_rank MPI_Comm_rank

#define atscntrb_mpi_MPI_Get_processor_name MPI_Get_processor_name


/* ****** ****** */

#endif // ifndef MPI_MPI_CATS

/* end of [mpi.cats] */
