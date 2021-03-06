source("incl/start.R")

message("*** FutureError class ...")

## Minimal
ex <- FutureError(message="Woops")
print(ex)

f <- future({ 42L; stop("XXX") })
v <- value(f, signal=FALSE)
print(v)
ex <- FutureError(message="Woops", future=f, output=c("Darn", "it"))
print(ex)

res <- getOutput(ex)
print(res)
stopifnot(all(res == c("Darn", "it")))

res <- getOutput(ex, head=1L)
print(res)
stopifnot(res == "Darn")

res <- getOutput(ex, tail=1L)
print(res)
stopifnot(res == "it")

res <- getOutput(ex, head=1L, tail=1L)
print(res)
stopifnot(res == c("Darn", "it"))

res <- getOutput(ex, collapse="\n")
print(res)
stopifnot(res == "Darn\nit")

message("*** FutureError class ... DONE")

source("incl/end.R")
