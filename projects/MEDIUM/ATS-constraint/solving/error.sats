exception FatalErrorException of ()

macdef abort () = $raise FatalErrorException()
