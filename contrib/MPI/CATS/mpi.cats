/* ****** ****** */
//
// API for MPI in ATS
//
/* ****** ****** */
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Starting time: October 15, 2014
//
/* ****** ****** */

#ifndef MPI_MPI_CATS
#define MPI_MPI_CATS

/* ****** ****** */

#include "mpi.h"

/* ****** ****** */

#define \
atscntrb_mpi_MPI_Comm_size MPI_Comm_size
#define \
atscntrb_mpi_MPI_Comm_rank MPI_Comm_rank

/* ****** ****** */

#define \
atscntrb_mpi_MPI_Get_processor_name MPI_Get_processor_name

/* ****** ****** */

#define atscntrb_mpi_MPI_Send MPI_Send
#define atscntrb_mpi_MPI_Recv MPI_Recv

/* ****** ****** */

#endif // ifndef MPI_MPI_CATS

/* ****** ****** */

/* end of [mpi.cats] */
