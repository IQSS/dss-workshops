!     Calculate the total number of people in the US reported by the 1980 census.

      PROGRAM sum1980
!     declare variable types
      INTEGER spop,tpop

      
      OPEN(UNIT=1,FILE="../data/1980_census.txt",ACTION="READ")
      
      tpop=0

      DO i=1,51
         READ(UNIT=1, FMT=*) spop
         tpop=tpop+spop
      ENDDO

      PRINT *, tpop

      END PROGRAM sum1980


