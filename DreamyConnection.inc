! Initial variables for Dreamy API.

DreamyConnection CLASS,MODULE('DreamyConnection.clw'),LINK('DreamyConnection.clw',1),DLL(0)

ServerAddress   STRING(20)
BaseURL			STRING(30)

Construct   PROCEDURE
Destruct	PROCEDURE

initiateConnection FUNCTION(STRING hostName),BYTE

! Config
! openSession	FUNCTION(STRING hostName),BYTE


! Setters
! SetBaseURL	PROCEDURE()

! Getters
! GetBaseURL	PROCEDURE()
get			FUNCTION(STRING hostName),LONG	! Simple 'GET' method that returns the content of a resource

	END


