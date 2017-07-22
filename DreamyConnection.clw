	MEMBER
INCLUDE('winInet.equ')
	MAP
INCLUDE('winInetMap.clw')
	END
	
	INCLUDE('DreamyConnection.inc'),ONCE

DreamyConnection.Construct	PROCEDURE()
	CODE
		
		
DreamyConnection.Destruct	PROCEDURE()
	CODE
	
DreamyConnection.initiateConnection FUNCTION(String hostName)
	CODE

			
		RETURN DreamyConnection.get('localhost')
		

		
DreamyConnection.get	FUNCTION  (STRING szServer ) ! Declare Procedure
hWininetSession      LONG                                  !
hWininetHttpSession  LONG                                  !
hWininetHttpRequest  LONG                                  !
dwBytesRead          LONG                                  !
dwOutSize            LONG                                  !
dwResult             LONG                                  !
szBuffer             LONG                         !
! Start of "Data Section"
! [Priority 3500]
dwBufferSize         equate ( size ( szBuffer ) - 1 )
! End of "Data Section"
  CODE
! Start of "Processed Code"
! [Priority 4000]
        dwResult = false
        dwOutSize = false

        hWininetSession = internetOpen ( address ( equ:szAgent ), INTERNET_OPEN_TYPE_PRECONFIG, false, false, false )

        if hWininetSession
            hWininetHttpSession = internetConnect ( hWininetSession, address ( szServer ), INTERNET_DEFAULT_HTTP_PORT, false, false, INTERNET_SERVICE_HTTP, false, true )
			MESSAGE( 'Identity established. Requesting a session now... ' )
            if hWininetHttpSession
                hWininetHttpRequest = httpOpenRequest ( hWininetHttpSession, address ( szGET ), address ( szAction ), false, false, false, false, true )
                
                MESSAGE( 'Session established. Now request a resource...' )

                if hWininetHttpRequest
					
					MESSAGE( 'Request found. Reading resource...' )
					
                    loop

                        loop 10 times
                            sleep ( 0 )
                        .

						! dwBufferSize is the number of bytes to read.
						! dwBytesRead Pointer to a variable that recieves the number of bytes read. 
						! internetReadFile() sets dwBytesRead to 0 before doing any work.
                        dwResult = internetReadFile ( hWininetHttpRequest, address ( szBuffer ), dwBufferSize, dwBytesRead )
                        if ~dwResult or ~dwBytesRead
                        	MESSAGE( GetLastError() )
                            break
                        .
						
                        if ( dwOutSize + dwBytesRead ) <= dw
						szPage# = 1Size#
                            szPage [ ( dwOutSize + 1 ) : ( dwOutSize + dwBytesRead ) ] = szBuffer [ 1 : dwBytesRead ]
                        else
                            szPage [ ( dwOutSize + 1 ) : dwSize# ] = szBuffer [ 1 : dwBytesRead ]
                            break
                        .
                        dwOutSize += dwBytesRead

                    .
                    
                    MESSAGE( szBuffer )
                    
                    internetCloseHandle ( hWininetHttpRequest )
                .

                internetCloseHandle ( hWininetHttpSession )
            .

            internetCloseHandle ( hWininetSession )
        .

    return szBuffer