program test
implicit none

   print*, 'hello world'
   
   open(10, file="singularity-helloworld.out")
      write(10, *) 'hello world output from the container'
   close(10)

end program
